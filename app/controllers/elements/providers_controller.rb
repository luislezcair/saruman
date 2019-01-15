class Elements::ProvidersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_provider, only: [:edit, :update, :destroy]
  authorize_resource
 
  # GET /elements/technicians
  def index
     setup_search
    @providers = @q.result.page(params[:page])
  end

  # GET /elements/technicians/new 
  def new
    @provider = Provider.new
    # @provider.contacts.build #edit
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

  # GET /technical_services/download
  def download
    setup_search
    @providers = @q.result
    exp = ProviderExporter.new(@providers)
    puts "---exp -------"
    puts exp
    send_data exp.to_excel_workbook.read,
              filename: "#{exp.filename}.xlsx",
              type: ProviderExporter::EXCEL_MIME_TYPE
  end

  private


  # Configura los parámetros de búsqueda para Ransack. El campo tipo de costo
  # es especial y se tiene que trasformar a una condicón == 0 o >= 0.
  # Las fechas vienen en formato dd/mm/yyyy. Para utilizarlas en la consulta a
  # la BD hay que agregarles la hora de principio del día y fin del día.
  #
  def setup_search
    @q = Provider.ransack(params[:q])
    @q.sorts = ['name asc'] if @q.sorts.empty?
  end

  def name_present?
    q = params[:q]
    q[:datetime_gteq].present? && q[:datetime_lteq].present?
  end

  def set_provider
    @provider = Provider.find(params[:id])
  end

  def provider_params 
    params.require(:provider).permit(
                                    :name,:email, :website, :tax_category_number, :identification_number, :withholdingstatus, :tax_category_id,
                                    contacts_attributes:[:id, :name, :phone, :type_phone, :_destroy], 
                                    addresses_attributes:[:id, :street, :house_number, :neighborhood,:block, :floor, :number_department,:_destroy],
                                    withholding_tax_ids: [])


  end
end
 