module ProductsHelper
  # Devuelve una descripción del producto que incluye Número de Producto, Nombre y Tipo.
  def product_label(prod)
    return unless prod
    "#{prod.product_number} - (#{prod.name}) - (#{prod.product_type})"
  end

  module_function :product_label
end