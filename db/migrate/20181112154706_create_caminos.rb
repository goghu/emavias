class CreateCaminos < ActiveRecord::Migration[5.1]
  def change
    create_table :caminos do |t|
      t.integer :unidade_id
      t.boolean :alternativo
      t.integer :correlativo, :limit => 2

      t.timestamps
    end
  end
end
