# frozen_string_literal: true

# Clase para exportar Providers a archivos como Excel, ajustando los
# atributos y las relaciones has_many para acomodarlos en una sola fila.
#
class ProviderExporter
    EXCEL_MIME_TYPE =
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
  
    def initialize(providers)
      @providers = providers
    end
   
    # Devuelve un arreglo con los nombres de los atributos para una fila de
    # encabezado.
    #

    def attributes
      attrs = %w[name contact_name email tax_category_number identification_number]
  
      attrs.map do |a|
        I18n.t(".activerecord.attributes.provider.#{a}")
      end
    end
  
    # Devuelve un arreglo con los valores de los atributos en el mismo orden
    # que los encabezados en `attributes`. Convierte las relaciones many-to-many
    # a string concatenando los valores que correspondan.
    #
    def values
      @providers.map do |p|
        [
        p.name,
        p.contact_name,
        p.email,
        p.website,
        p.tax_category_number,
        p.identification_number
        ] 
      end
    end
  
    # Devuelve un arreglo con los formatos de datos para el archivo de Excel.
    # Tienen que tener el mismo orden que `attributes`. Si se coloca nil o se
    # omite el formato queda como string.
    #
    def formats
      [
        nil,
        nil,
        nil, 
        nil, 
        nil,
        nil
      ]
    end
  
    def model_name 
      I18n.t('activerecord.models.provider', count: 2)
    end
  
    def filename
      model_name.gsub(/\s/, '_').downcase
    end
  
    # Genera un archivo de Excel y devuelve un Stream para leerlo. No se guarda
    # en el sistema de archivos.
    #
    def to_excel_workbook
      p = Axlsx::Package.new
      wb = p.workbook
      styles = formats.map { |f| wb.styles.add_style(format_code: f) }
  
      wb.add_worksheet(name: model_name) do |sheet|
        sheet.add_row attributes
  
        values.each do |v|
          sheet.add_row v, style: styles
        end
  
        sheet.auto_filter = 'A1:AD1'
      end
  
      p.to_stream
    end
  end
  