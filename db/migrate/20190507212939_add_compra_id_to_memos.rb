class AddCompraIdToMemos < ActiveRecord::Migration[5.1]
  def change
    add_column :memos, :compra_id, :integer, after: :id
  end
end
