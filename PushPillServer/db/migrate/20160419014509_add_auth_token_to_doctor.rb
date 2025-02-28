class AddAuthTokenToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :authentication_token, :string
    add_index :doctors, :authentication_token, :unique => true
  end
end
