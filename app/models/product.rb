class Product < ApplicationRecord
  extend Enumerize

  has_and_belongs_to_many :categories
  validates :product_number, :name, :type, presence :true

  enumerize :type, in: [:accessory, :product, :service]
end
