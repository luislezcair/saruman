class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :deposit
  belongs_to :provider
  has_many :move_details
  
  attr_accessor :product_quantity

  #validates :product_quantity,
  #          numericality: { less_than: 2**30 }

  extend Enumerize

  enumerize :status,  
              in: { disponible: 0, en_carga: 1, en_transito: 2, vendido: 3, eliminado: 4 }, 
              default: :disponible, 
              predicates: true
  
  # Método que devuelve la cantidad de stock existente para un producto dentro del inventario, 
  # indistinto del depósito donde se encuentre.
  def stock_count(inv)
    count = Inventory.where(product_id: inv.product_id, product_exist: true).count
  end

  def stock_count_per_deposit(inv)
    count = Inventory.where(product_id: inv.product_id, product_exist: true, deposit_id: inv.deposit_id).count
  end

end
