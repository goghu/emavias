class CreateAlternativos < ActiveRecord::Migration[5.1]
  def change
    create_table :alternativos do |t|
      t.integer :ruta_id
      t.integer :alternativo_id
      t.string :estado, :limit => 20
      t.string :obs, :limit => 255

      t.timestamps
    end
  end
end
