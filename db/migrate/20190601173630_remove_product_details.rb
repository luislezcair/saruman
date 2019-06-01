# frozen_string_literal: true

class RemoveProductDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :ac, :boolean
    remove_column :products, :power_in, :string
    remove_column :products, :power_out, :string
    remove_column :products, :poe, :string
  end
end
