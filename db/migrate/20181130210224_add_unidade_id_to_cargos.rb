class AddUnidadeIdToCargos < ActiveRecord::Migration[5.1]
  def change
    add_column :cargos, :unidade_id, :integer, after: :id
  end
end
