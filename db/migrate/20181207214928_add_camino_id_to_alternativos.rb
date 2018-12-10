class AddCaminoIdToAlternativos < ActiveRecord::Migration[5.1]
  def change
    add_column :alternativos, :camino_id, :integer, after: :id
  end
end
