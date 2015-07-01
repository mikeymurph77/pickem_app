class AddUsernameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :username, :string
  	add_column :users, :first_name, :string
  end
end
