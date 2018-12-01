class AddTipoToDocumentos < ActiveRecord::Migration[5.1]
  def change
    add_column :documentos, :tipo, :string, :limit => 120, after: :id
  end
end
