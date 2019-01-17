class Deposit < ApplicationRecord
  belongs_to :country, optional: true
  belongs_to :province, optional: true
  belongs_to :city, optional: true

  extend Enumerize
  validates :name, presence: :true

  enumerize :deposit_type,  
              in: { oficina: 0, vehiculo: 1 }, 
              default: :oficina, 
              predicates: true
end
