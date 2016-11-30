class CreateLikes < ActiveRecord::Migration
  def self.up
	  create_table :likes do |t|
	    t.references :post, index: true, foreign_key: true
	    t.references :user, index: true, foreign_key: true
	    t.timestamps null: false
	  end
  end

  def self.down
  	drop_table :likes
  end
end
