class CreateUnidades < ActiveRecord::Migration[5.1]
  def change
    create_table :unidades do |t|
      t.string :descripcion, :limit => 150
      t.boolean :estado

      t.timestamps
    end
  end
end
