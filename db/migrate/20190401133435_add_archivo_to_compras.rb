class AddArchivoToCompras < ActiveRecord::Migration[5.1]
  def change
    add_column :compras, :archivo, :string, after: :obs
  end
end
