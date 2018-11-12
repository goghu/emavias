class CreateCompras < ActiveRecord::Migration[5.1]
  def change
    create_table :compras do |t|
      t.string :numero, :limit => 20
      t.string :docvalor, :limit => 25
      t.date :fecha

      t.timestamps
    end
  end
end
