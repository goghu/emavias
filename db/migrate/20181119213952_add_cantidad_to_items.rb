class AddCantidadToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :cantidad, :integer, after: :unidad
  end
end
