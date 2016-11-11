class AddLocationToPost < ActiveRecord::Migration
  def self.up
  	add_column :posts, :loc_name, :string
  end

  def self.down
  	drop_colmn :posts, :loc_name
  end
end
