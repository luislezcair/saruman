class Product < ApplicationRecord
  extend Enumerize

  belongs_to :producer
  belongs_to :category
  validates :product_number, :name, :type, presence: :true

  enumerize :type, in: [:accessory, :product, :service]
end
