class AddReferenciaToCompras < ActiveRecord::Migration[5.1]
  def change
    add_column :compras, :referencia, :string, after: :docvalor
  end
end
