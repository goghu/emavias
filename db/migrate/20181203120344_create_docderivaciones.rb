class CreateDocderivaciones < ActiveRecord::Migration[5.1]
  def change
    create_table :docderivaciones do |t|
      t.integer :camino_id
      t.string :descripcion, :limit => 150
      t.string :docvalor, :limit => 180
      t.boolean :presento
      t.string :estado, :limit => 20

      t.timestamps
    end
  end
end
