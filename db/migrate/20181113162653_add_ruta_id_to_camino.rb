class AddRutaIdToCamino < ActiveRecord::Migration[5.1]
  def change
    add_column :caminos, :ruta_id, :integer, after: :id
  end
end
