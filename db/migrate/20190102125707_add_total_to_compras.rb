class AddTotalToCompras < ActiveRecord::Migration[5.1]
  def change
    add_column :compras, :total, :decimal, after: :teref, precision: 10, scale: 2
  end
end
