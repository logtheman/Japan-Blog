class AddLocationToPost < ActiveRecord::Migration
  def self.up
  	add_column :posts, :location, :string
  end

  def self.down
  	drop_colmn :posts, :location
  end
end
