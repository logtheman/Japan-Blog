class Attachement < ActiveRecord::Base
	belongs_to :attachable, polymorphic: true	

	has_attached_file :image, styles: { thumb: "64x64", med: "100x100", large: "200x200" }, 
		default_url: ":rails_root/public/system/app/images/:style/missing.png",
        :url  => "/assets/images/posts/:basename.:extension",
        :path => ":rails_root/public/assets/images/posts/:basename.:extension"
end
