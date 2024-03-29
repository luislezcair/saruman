# frozen_string_literal: true

# Representa un producto en inventario
class Product < ApplicationRecord
  extend Enumerize

  belongs_to :category
  belongs_to :producer

  belongs_to :family, optional: true
  belongs_to :product_type, optional: true

  validates :product_number, :name, presence: true, uniqueness: true
  validates :stock_min_default, :reorder_point_default, presence: true

  enumerize :unit, in: { unidades: 0,
                         metros: 1,
                         paquetes: 2,
                         cajas: 3 },
                   default: :unidades,
                   predicates: true

  def reorder_point?(stock, reorder_point)
    stock <= reorder_point
  end
end
