class AddUserIdToCompras < ActiveRecord::Migration[5.1]
  def change
    add_column :compras, :user_id, :integer, after: :id
  end
end
