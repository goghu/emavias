class CreateMigraciones < ActiveRecord::Migration[5.1]
  def change
    create_table :migraciones do |t|
      t.string :cite, :limit => 150
      t.text :documento
      t.date :fecha

      t.timestamps
    end
  end
end
