class CreateEscogidos < ActiveRecord::Migration[5.1]
  def change
    create_table :escogidos do |t|
      t.integer :memo_id
      t.integer :user_id

      t.timestamps
    end
  end
end
