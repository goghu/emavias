class CreateMemos < ActiveRecord::Migration[5.1]
  def change
    create_table :memos do |t|
      t.integer :docderivacione_id
      t.string :cite, :limit => 240
      t.text :documento
      t.date :fecha

      t.timestamps
    end
  end
end
