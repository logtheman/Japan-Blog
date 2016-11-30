class Post < ActiveRecord::Base
	has_many :comments
  has_many :likes, dependent: :destroy
	belongs_to :user
  has_many :attachements, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachements, :allow_destroy => true

	has_attached_file :image, styles: { thumb: "64x64", med: "100x100", large: "200x200" }, 
		default_url: ":rails_root/public/system/app/images/:style/missing.png",
        :url  => "/assets/images/posts/:basename.:extension",
        :path => ":rails_root/public/assets/images/posts/:basename.:extension"

  	validates_attachment_size :image, :less_than => 5.megabytes
  	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  	validates :title, presence: true,
                    length: { minimum: 5 }
    acts_as_taggable

    scope :sort_by_newest, -> { order(created_at: :desc) }
    scope :username, -> { User.find(user_id) }


  def liked?(user)
    @like = self.likes.find_by_post_id(self.id)
    if @like.present?
      if @like.user == user
        true
      else
        false
      end
    end
  end
end
