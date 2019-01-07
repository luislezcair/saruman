class Elements::DepositsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deposit, only: [:edit, :update, :destroy]
  authorize_resource
  
  # GET /element/deposits/search
  def search
    setup_search

    @deposits = @deposits.where('1=0') unless search_params? && valid_params?
    @name_cont = params.dig(:q, :name_cont)
  end

  # GET /elements/deposits
  def index
    @q = Deposit.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @deposits = @q.result.page(params[:page])
  end

  # GET /elements/deposits/new
  def new
    @deposit = Deposit.new
  end

  def edit; end

  # POST /elements/deposits
  def create
    @deposit = Deposit.new(deposit_params)
    if @deposit.save
      redirect_to elements_deposits_path
    else
      render :new, alert: :error
    end
  end

  # PUT/PATCH /elements/deposits/1
  def update
    if @deposit.update(deposit_params)
      redirect_to elements_deposits_path
    else
      render :edit, alert: :error
    end
  end

  # DELETE /elements/deposits/1
  def destroy
    destroy_model(@deposit)
  end

  private

  def setup_search
    @q = Deposit.accessible_by(current_ability).ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @deposits = @q.result.page(params[:page]).per(10)
  end

  # Buscar solamente si el usuario ingresó 3 o más caracteres para limitar la
  # cantidad de resultados.
  def valid_params?
    id = params.dig(:q, :name_cont)
    id && id.size > 2
  end

  def set_deposit
    @deposit = Deposit.find(params[:id])
  end

  def deposit_params
    params.require(:deposit).permit(:name, :description, :deposit_type, :address, :city_id, :province_id, :country_id)
  end
end
