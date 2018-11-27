class AddRutaIdToDerivaciones < ActiveRecord::Migration[5.1]
  def change
    add_column :derivaciones, :ruta_id, :integer, after: :id
  end
end
