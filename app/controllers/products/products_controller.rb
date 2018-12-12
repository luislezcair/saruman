class Products::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:edit, :update, :destroy]
  authorize_resource

  # GET /product/products
  def index 
    @q = Product.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @products = @q.result.page(params[:page])
  end

  # GET /product/products/new
  def new
    @product = Product.new
  end

  def edit; end

  # POST /product/products
  def create
    @product = Product.new(product_params)
    if @product.save 
      redirect_to products_products_path
    else
      render :new, alert: :error
    end
  end

  # PUT/PATCH /products/products/1
  def update
    if @product.update(product_params)
      redirect_to products_products_path
    else
      render :edit, alert: :error 
    end
  end

  # DELETE /products/products/1
  def destroy 
    destroy_model(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_number, :name, :description, :type, :ac, :power_in, :power_out, :poe)
  end
end
