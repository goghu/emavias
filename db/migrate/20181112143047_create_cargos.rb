class CreateCargos < ActiveRecord::Migration[5.1]
  def change
    create_table :cargos do |t|
      t.string :descripcion, :limit => 150
      t.integer :nivel

      t.timestamps
    end
  end
end
