class AddJustificacionToCompras < ActiveRecord::Migration[5.1]
  def change
    add_column :compras, :justificacion, :text, after: :docvalor
  end
end
