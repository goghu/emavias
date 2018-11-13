class AddCaminoIdToDocumentos < ActiveRecord::Migration[5.1]
  def change
    add_column :documentos, :camino_id, :integer, after: :id
  end
end