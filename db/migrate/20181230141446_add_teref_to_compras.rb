class AddTerefToCompras < ActiveRecord::Migration[5.1]
  def change
    add_column :compras, :teref, :boolean, after: :autorizaciones
  end
end
