class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :compra_id
      t.string :descripcion, :limit => 150
      t.string :unidad, :limit => 15
      t.decimal :p_unitario, :precision => 10, :scale => 2
      t.decimal :p_referencial, :precision => 10, :scale => 2
      t.boolean :estado

      t.timestamps
    end
  end
end
