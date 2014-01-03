class Post < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :posts

  validates_presence_of :user
  validates_presence_of :image

  validates_length_of :description, maximum: 140

  mount_uploader :image, PostImageUploader

  class << self
    def by_recency
      order(created_at: :desc)
    end
  end
end
