class AddDerivacioneIdToDocderivaciones < ActiveRecord::Migration[5.1]
  def change
    add_column :docderivaciones, :derivacione_id, :string, after: :id
  end
end
