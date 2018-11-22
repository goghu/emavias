class AddJefeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :jefe, :boolean, after: :id
  end
end
