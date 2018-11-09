class CambiarEmailToUsers < ActiveRecord::Migration[5.1]
  def change
  	change_table :users do |t|
  		t.change :email, :string, null: true
  		t.change :encrypted_password, :string, null: true
  	end
  end
end
