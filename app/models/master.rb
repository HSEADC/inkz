class Master < ApplicationRecord
  belongs_to :user
  has_many :tattoos, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  validates :name, :nickname, :user_id, presence: true
end
