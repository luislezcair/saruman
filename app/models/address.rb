class Address < ApplicationRecord
  belongs_to :city
  belongs_to :province
  belongs_to :country
end
