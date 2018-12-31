class CreateDocumentos < ActiveRecord::Migration[5.1]
  def change
    create_table :documentos do |t|
      t.string :descripcion, :limit => 150
      t.integer :correlativo, :limit => 2
      t.boolean :presento
      t.string :observaciones

      t.timestamps
    end
  end
end
