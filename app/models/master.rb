class Master < ApplicationRecord
  belongs_to :user
  has_many :tattoos, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :name, presence: true
  validates :nickname, presence: true
  validates :user_id, presence: true
end
