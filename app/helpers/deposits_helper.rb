module DepositsHelper
  def sorted_deposit_type
    DepositType.sorted 

  end
  def sorted_city
    City.sorted
  end
  # Devuelve una descripción del depósito que incluye Nombre, Tipo y Dirección.
  def deposit_label(dep)
    return unless dep
    "(#{dep.name}) - (#{dep.deposit_type.name}) - (#{dep.address})"
  end

  module_function :deposit_label
end 