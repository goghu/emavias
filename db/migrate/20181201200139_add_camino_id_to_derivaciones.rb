class AddCaminoIdToDerivaciones < ActiveRecord::Migration[5.1]
  def change
    add_column :derivaciones, :camino_id, :integer, after: :id
  end
end
