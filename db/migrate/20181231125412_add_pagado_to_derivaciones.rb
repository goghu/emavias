class AddPagadoToDerivaciones < ActiveRecord::Migration[5.1]
  def change
    add_column :derivaciones, :pagado, :string, :limit => 15, after: :estado
  end
end
