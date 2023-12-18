class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :master

  validates :comment, :rating, presence: true
end
