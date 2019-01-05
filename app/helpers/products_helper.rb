module ProductsHelper
  # Devuelve una descripción del producto que incluye Número de Producto, Nombre y Tipo.
  def product_label(prod)
    return unless prod
    "#{cli.product_number} - (#{cli.name}) - (#{cli.type})"
  end

  module_function :product_label
end