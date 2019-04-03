class AddMemorandumToDocumentos < ActiveRecord::Migration[5.1]
  def change
    add_column :documentos, :memorandum, :string, :limit => 20, after: :observaciones
  end
end
