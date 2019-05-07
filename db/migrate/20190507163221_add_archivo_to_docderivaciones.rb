class AddArchivoToDocderivaciones < ActiveRecord::Migration[5.1]
  def change
    add_column :docderivaciones, :adjunto, :string, after: :docvalor
  end
end
