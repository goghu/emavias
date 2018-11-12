class CreateGestiones < ActiveRecord::Migration[5.1]
  def change
    create_table :gestiones do |t|
      t.string :numero, :limit => 10

      t.timestamps
    end
  end
end
