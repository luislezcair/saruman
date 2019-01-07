module DepositsHelper
  # Devuelve una descripción del depósito que incluye Nombre, Tipo y Dirección.
  def deposit_label(dep)
    return unless dep
    "(#{dep.name}) - (#{dep.deposit_type})- (#{dep.address})"
  end

  module_function :deposit_label
end