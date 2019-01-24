class RemoveContryFromAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :city, :string
    remove_column :addresses, :country, :string
    remove_column :addresses, :state, :string
    add_reference :addresses, :city, foreign_key: true
    add_reference :addresses, :province, foreign_key: true
    add_reference :addresses, :country, foreign_key: true
  end
end
