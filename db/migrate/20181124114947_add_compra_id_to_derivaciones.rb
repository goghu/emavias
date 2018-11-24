class AddCompraIdToDerivaciones < ActiveRecord::Migration[5.1]
  def change
    add_column :derivaciones, :compra_id, :integer, after: :id
  end
end
