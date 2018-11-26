class AddCorrelativoToDerivaciones < ActiveRecord::Migration[5.1]
  def change
    add_column :derivaciones, :correlativo, :integer, after: :id
  end
end
