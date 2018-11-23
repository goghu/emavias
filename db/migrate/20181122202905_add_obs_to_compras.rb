class AddObsToCompras < ActiveRecord::Migration[5.1]
  def change
    add_column :compras, :obs, :string, after: :fecha
  end
end
