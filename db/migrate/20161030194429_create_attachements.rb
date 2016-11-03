class CreateAttachements < ActiveRecord::Migration
  def self.up
    create_table :attachements do |t|
      t.text :description
      t.references :attachable, polymorphic: true, index: true
 
      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :attachements
  end
end
