class AddCamposemaToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ap, :string, after: :email, :limit => 15
    add_column :users, :am, :string, after: :email, :limit => 15
    add_column :users, :cargo_id, :integer, after: :email
    add_column :users, :estado, :boolean, after: :email
  end
end
