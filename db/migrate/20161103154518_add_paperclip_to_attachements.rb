class AddPaperclipToAttachements < ActiveRecord::Migration
  def self.up
  	add_attachment :attachements, :image
  end

  def self.down
    remove_attachment :attachements, :image
  end
end
