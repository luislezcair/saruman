class Product < ApplicationRecord
  extend Enumerize

  belongs_to :producer
  belongs_to :category
  belongs_to :family, optional: true
  validates :product_number, :name, :type, presence: :true

  enumerize :type,  in: { accesorio: 0, producto: 1, servicio: 2 }, 
                    default: :producto, 
                    predicates: true
end
