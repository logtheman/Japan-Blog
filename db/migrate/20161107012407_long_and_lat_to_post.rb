class LongAndLatToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :lat, :decimal, {:precision=>10, :scale=>6}
	add_column :posts, :lng, :decimal, {:precision=>10, :scale=>6}
  end
  def self.down
  	drop_column :posts, :lat
  	drop_column :posts, :lng
  end
end
