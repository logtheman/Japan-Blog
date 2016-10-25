class AddUsernameToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :user_name
    add_column :users, :username, :string
  end
end
