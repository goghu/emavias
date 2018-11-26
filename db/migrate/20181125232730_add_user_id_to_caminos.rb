class AddUserIdToCaminos < ActiveRecord::Migration[5.1]
  def change
    add_column :caminos, :user_id, :integer, after: :id
  end
end
