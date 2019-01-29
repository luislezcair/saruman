class MovesController < ApplicationController
  def index
    @moves = Move.joins(:user_take, :user_register, move_details: :site_to).distinct()
  end

  def edit
    @move = Move.find_by_id(params[:id])
    @move_details = MoveDetail.joins(:inventory).where(move_id: params[:id])
  end

  def update
  end

  def show
  end

  def destroy_move_detail
    @move_detail = MoveDetail.find(params[:id])
    move = @move_detail.move
    inventory = Inventory.find(@move_detail.inventory.id)
    inventory.update_attributes(status: :disponible)
    @move_detail.destroy

    respond_to do |format|
      format.html { redirect_to edit_move_path(move) }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end
end
