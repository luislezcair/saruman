class Product < ApplicationRecord
  extend Enumerize

  belongs_to :producer
  belongs_to :category
  belongs_to :family, optional: true
  validates :product_number, :name, :type, presence: :true

  enumerize :type, in: [:accessory, :product, :service]
end
