class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :text, presence: true
end
