class AddRemitenteToDocumentos < ActiveRecord::Migration[5.1]
  def change
    add_column :documentos, :remitente, :integer, after: :memorandum
  end
end
