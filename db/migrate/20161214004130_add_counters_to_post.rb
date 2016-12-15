class AddCountersToPost < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.integer :likes_count
      t.integer :comments_count
      t.integer :users_count
    end
  end

  def self.down
    drop_column :posts, :likes_count
    drop_column :posts, :comments_count
    drop_column :posts, :users_count
  end
end
