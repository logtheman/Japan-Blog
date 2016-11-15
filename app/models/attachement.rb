class Attachement < ActiveRecord::Base
	belongs_to :attachable, polymorphic: true	

	has_attached_file :image, styles: { thumb: "64x64", med: "200x200", large: "400x400" }, 
		default_url: ":rails_root/public/system/app/images/:style/missing.png",
        :url  => "/assets/images/posts/:basename.:extension",
        :path => ":rails_root/public/assets/images/posts/:basename.:extension"

  	validates_attachment_size :image, :less_than => 5.megabytes
  	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
end
