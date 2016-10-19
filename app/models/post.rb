class Post < ActiveRecord::Base
	has_many :comments
  	validates :title, presence: true,
                    length: { minimum: 5 }
    acts_as_taggable

    scope :sort_by_newest, -> { order(created_at: :desc) }
end
