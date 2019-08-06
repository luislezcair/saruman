# frozen_string_literal: true

# Agregar precios de compra y de venta a Producto
class AddPricesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sale_price, :decimal, precision: 15, scale: 2
    add_column :products, :cost_price, :decimal, precision: 15, scale: 2
  end
end
