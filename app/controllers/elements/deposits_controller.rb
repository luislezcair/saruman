class Elements::DepositsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deposit, only: [:edit, :update, :destroy]
  authorize_resource

  # GET /elements/deposits
  def index
    @q = Deposit.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @deposits = @q.result.page(params[:page])
  end

  # GET /elements/deposits/new
  def new
    @deposits= Deposit.new
  end

  def edit; end

  # POST /elements/deposits
  def create
    @deposit = Deposit.new(deposit_params)
    if @deposit.save
      redirect_to elements_deposit_path
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

  def set_deposit
    @deposit = Deposit.find(params[:id])
  end

  def deposit_params
    params.require(:deposit).permit(:name, :description, :type)
  end
end
