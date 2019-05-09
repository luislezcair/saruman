# frozen_string_literal: true

# Controlador para movimientos
class MovesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_move, only: [:show, :edit, :update]
  authorize_resource

  def index
    @q = Move.ransack(params[:q])
    @moves = @q.result(distinct: true)
               .includes(:user_take)
               .includes(:user_register)
               .includes(move_details: :site_to)
               .joins(:user_take)
               .joins(:user_register)
               .joins(move_details: :site_to)
               .page(params[:page])
  end

  def edit; end

  def update
    if @move.update(move_params)
      case @move.status
      when 'en_carga', 'retrasado', 'en_espera'
        @move_details.each { |md| md.inventory.update(status: :en_movimiento) }
      when 'en_transito'
        @move_details.each { |md| md.inventory.update(status: :en_transito) }
      when 'recibido'
        @move_details.each do |md|
          md.inventory.update(status: :disponible, deposit_id: md.site_to_id)
        end
      when 'eliminado'
        @move_details.each { |md| md.inventory.update(status: :disponible) }
      end

      redirect_to moves_path
    else
      render :edit, alert: :error
    end
  end

  def show; end

  def destroy_move_detail
    @move_detail = MoveDetail.find(params[:id])
    move = @move_detail.move
    inventory = Inventory.find(@move_detail.inventory.id)
    inventory.update(status: :disponible, deposit: @move_detail.site_from)
    @move_detail.destroy

    respond_to do |format|
      format.html { redirect_to edit_move_path(move) }
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end

  def download
    setup_search
    exp = MoveExporter.new(@moves)
    send_data exp.to_excel_workbook.read,
              filename: "#{exp.filename}.xlsx",
              type: MoveExporter::EXCEL_MIME_TYPE
  end

  private

  def setup_search
    @q = Move.ransack(params[:q])
    @moves = @q.result(distinct: true)
               .includes(:user_take)
               .includes(:user_register)
               .includes(move_details: :site_to)
               .joins(:user_take)
               .joins(:user_register)
               .joins(move_details: :site_to)
               .page(params[:page])
  end

  def set_move
    @move = Move.find_by_id(params[:id])
    @move_details = MoveDetail.joins(:inventory).where(move_id: params[:id])
  end

  def move_params
    params.require(:move)
          .permit(:move_date, :status, :user_register_id, :user_take_id,
                  :voucher_type_id, :voucher_number)
  end
end
