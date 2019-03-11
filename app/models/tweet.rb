class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :text, presence: true

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

  def self.search(search)
    return Tweet.all unless search
    Tweet.where(['text LIKE ?', "%#{search}%"])
  end
end
