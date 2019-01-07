class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :deposit
  belongs_to :provider
  

  attribute :product_quantity

  validates :product_quantity,
            numericality: { less_than: 2**30 },
            presence: :true
end
