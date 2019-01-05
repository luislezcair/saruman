class InventoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  authorize_resource

  # GET /inventories
  def index
    @inventories = Inventory.ransack(params[:q])
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  def edit; end

  # POST /inventories
  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.save
      redirect_to inventories_path
    else
      render :new, alert: :error
    end
  end

  # PUT/PATCH /inventories/1
  def update
    if @inventory.update(inventory_params)
      redirect_to inventories_path
    else
      render :edit, alert: :error
    end
  end

  # DELETE /inventories/1
  def destroy
    destroy_model(@inventory)
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  def inventory_params
    params.require(:inventory).permit(:product_id, :deposit_id, :firmware_version, :serial_number, :mac_address)
  end
end