class AddMinimoToCompras < ActiveRecord::Migration[5.1]
  def change
    add_column :compras, :minimo, :boolean, after: :docvalor
  end
end
