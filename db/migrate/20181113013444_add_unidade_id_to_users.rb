class AddUnidadeIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :unidade_id, :integer, after: :id
  end
end
