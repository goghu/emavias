class AddCominternaToCompras < ActiveRecord::Migration[5.1]
  def change
    add_column :compras, :cominterna, :string, after: :docvalor
  end
end
