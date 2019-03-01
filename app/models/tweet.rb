class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
  validates :text, presence: true
end
