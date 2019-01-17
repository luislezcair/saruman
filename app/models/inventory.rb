class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :deposit
  belongs_to :provider
  has_many :move_details
  
  attribute :product_quantity

  validates :product_quantity,
            numericality: { less_than: 2**30 }

  before_save :default_values

  def default_values
    self.product_exist ||= true
    self.serial_number ||= 'empty'
    self.product_quantity ||= 1
  end
  
  # Método que devuelve la cantidad de stock existente para un producto dentro del inventario, 
  # indistinto del depósito donde se encuentre.
  def stock_count(inv)
    count = Inventory.where(product_id: inv.product_id, product_exist: true).count
  end

  def stock_count_per_deposit(inv)
    count = Inventory.where(product_id: inv.product_id, product_exist: true, deposit_id: inv.deposit_id).count
  end

end
