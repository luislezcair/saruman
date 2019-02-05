class Product < ApplicationRecord
  extend Enumerize

  belongs_to :producer
  belongs_to :category
  belongs_to :family, optional: true
  belongs_to :product_type, optional: true
  validates :product_number, :name, presence: :true, uniqueness: true
  validates :stock_min_default, :reorder_point_default, presence: :true
end
