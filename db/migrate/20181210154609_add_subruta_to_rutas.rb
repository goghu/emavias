class AddSubrutaToRutas < ActiveRecord::Migration[5.1]
  def change
    add_column :ruta, :subruta, :boolean, after: :descripcion
  end
end
