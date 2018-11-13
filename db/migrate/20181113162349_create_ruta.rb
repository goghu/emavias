class CreateRuta < ActiveRecord::Migration[5.1]
  def change
    create_table :ruta do |t|
      t.string :nombre, :limit => 150
      t.string :descripcion, :limit => 255

      t.timestamps
    end
  end
end
