class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, length: { minimum: 4, maximum: 16 }  
  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy


	has_attached_file :image, styles: { thumb: "64x64", med: "200x200", large: "300x300" }, 
		default_url: ":rails_root/public/system/app/images/:style/avatar_2x.png",
        :url  => "/assets/images/users/:basename.:extension",
        :path => ":rails_root/public/assets/images/users/:basename.:extension"

  	validates_attachment_size :image, :less_than => 5.megabytes
  	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
    
  # creates a new heart row with post_id and user_id
  def like!(post)
    self.likes.create!(post_id: post.id)
  end

  # destroys a like with matching post_id and user_id
  def unlike!(post)
    like = self.likes.find_by_post_id(post.id)
    like.destroy!
  end

  # returns true of false if a post is liked by user
  def like?(post)
    self.likes.find_by_post_id(post.id)
  end

end
