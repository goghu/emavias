class CreateDerivaciones < ActiveRecord::Migration[5.1]
  def change
    create_table :derivaciones do |t|
      t.integer :usero_id
      t.integer :unidadeo_id
      t.integer :userd_id
      t.integer :unidadd_id
      t.date :fecha
      t.string :estado, :limit => 15
      t.string :observaciones, :limit => 255

      t.timestamps
    end
  end
end
