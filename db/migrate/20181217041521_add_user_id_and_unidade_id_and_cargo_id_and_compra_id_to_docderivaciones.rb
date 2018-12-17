class AddUserIdAndUnidadeIdAndCargoIdAndCompraIdToDocderivaciones < ActiveRecord::Migration[5.1]
  def change
    add_column :docderivaciones, :user_id, :integer, after: :id
    add_column :docderivaciones, :unidade_id, :integer, after: :id
    add_column :docderivaciones, :cargo_id, :integer, after: :id
    add_column :docderivaciones, :compra_id, :integer, after: :id
  end
end
