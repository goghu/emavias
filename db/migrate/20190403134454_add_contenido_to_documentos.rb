class AddContenidoToDocumentos < ActiveRecord::Migration[5.1]
  def change
    add_column :documentos, :contenido, :text, after: :remitente
  end
end
