class ProductType < ApplicationRecord
    has_many :products
    scope :sorted, -> { order(:name) }
end
