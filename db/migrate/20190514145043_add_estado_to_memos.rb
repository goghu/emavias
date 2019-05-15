class AddEstadoToMemos < ActiveRecord::Migration[5.1]
  def change
    add_column :memos, :estado, :string, :limit=>15, after: :documento
  end
end