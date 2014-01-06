class Post < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :posts

  has_many :meows,
    dependent: :destroy,
    inverse_of: :post

  validates_presence_of :user
  validates_presence_of :image

  validates_length_of :description, maximum: 140

  mount_uploader :image, PostImageUploader

  def meow_from(user)
    meows.find_by(user_id: user.id)
  end

  def has_meow_from?(user)
    meows.find_by(user_id: user.id).present?
  end

  class << self
    def by_recency
      order(created_at: :desc)
    end
  end
end
