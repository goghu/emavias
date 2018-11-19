class AddExistenciaAndPoaAndPresupuestariaToCompras < ActiveRecord::Migration[5.1]
  def change
    add_column :compras, :existencia, :boolean, after: :docvalor
    add_column :compras, :poa, :boolean, after: :docvalor
    add_column :compras, :presupuestaria, :boolean, after: :docvalor
  end
end
