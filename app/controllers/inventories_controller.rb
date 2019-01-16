class InventoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inventory, only: [:edit, :update, :destroy]
  authorize_resource

  # GET /inventories
  def index
    @q = Inventory.ransack(params[:q])
    @q.sorts = 'product.name asc' if @q.sorts.empty?
    @inventories = @q.result
                    .select('inventories.product_id, inventories.deposit_id')
                    .group('inventories.product_id, inventories.deposit_id')
                    .page(params[:page])
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  def deposit_stock
    @inventories = Inventory.where(product_id: params[:product_id])
    @inventory = @inventories.take    
  end

  def edit; end

  # POST /inventories
  def create
    inventory_params[:product_quantity].to_i.times do |i|
      @inventory = Inventory.new(inventory_params)
      @inventory.save
    end 
    #if @inventory.save
      redirect_to inventories_path
    #else
    #  render :new, alert: :error
    #end
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
    params.require(:inventory).permit(:product_id, :deposit_id, :provider_id, :firmware_version, :serial_number, :mac_address, :product_exist, :product_quantity)
  end
end