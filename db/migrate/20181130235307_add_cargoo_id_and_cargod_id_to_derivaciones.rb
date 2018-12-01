class AddCargooIdAndCargodIdToDerivaciones < ActiveRecord::Migration[5.1]
  def change
    add_column :derivaciones, :cargoo_id, :integer, after: :id
    add_column :derivaciones, :cargod_id, :integer, after: :id
  end
end
