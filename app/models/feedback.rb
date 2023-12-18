class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :master

  mount_uploader :feedback_image, FeedbackImageUploader

  validates :comment, presence: true
  validates :rating, presence: true, inclusion: { in: 0..5 }
end
