class Elements::ProvidersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_provider, only: [:edit, :update, :destroy]
  authorize_resource

  # GET /elements/technicians
  def index
    @q = Provider.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @providers = @q.result.page(params[:page])
  end

  # GET /elements/technicians/new
  def new
    @provider = Provider.new
    @provider.contacts.build #edit
  end

  def edit; end

  # POST /elements/technicians
  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      redirect_to elements_providers_path
    else
      render :new, alert: :error
    end
  end

  # PUT/PATCH /elements/technicians/1
  def update
    if @provider.update(provider_params)
      redirect_to elements_providers_path
    else
      render :edit, alert: :error
    end
  end

  # DELETE /elements/technicians/1
  def destroy
    destroy_model(@provider)
  end

  private

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params
    params.require(:provider).permit(:name, contacts_attributes:[:name, :phone, :type_phone, :_destroy])
  end
end
