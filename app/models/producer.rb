class Producer < ApplicationRecord
  has_one :product
  validates :name, presence :true
end
