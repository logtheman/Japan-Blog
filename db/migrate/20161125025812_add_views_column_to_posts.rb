class AddViewsColumnToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.integer :views
    end
  end

  def self.down
    drop_column :posts, :views
  end
end
