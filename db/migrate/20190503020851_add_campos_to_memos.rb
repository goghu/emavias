class AddCamposToMemos < ActiveRecord::Migration[5.1]
  def change
    add_column :memos, :camino_id, :integer, after: :documento
    add_column :memos, :ruta_id, :integer, after: :documento
    add_column :memos, :correlativo, :integer, after: :documento
    add_column :memos, :usero_id, :integer, after: :documento
    add_column :memos, :remitente_id, :integer, after: :documento
  end
end
