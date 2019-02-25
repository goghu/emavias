class AddOtrosToCompras < ActiveRecord::Migration[5.1]
  def change
    add_column :compras, :otros, :string, after: :obs
  end
end
