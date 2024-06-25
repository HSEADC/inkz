class Master < ApplicationRecord
  belongs_to :user
  has_many :tattoos, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  
  mount_uploader :master_image, MasterImageUploader
  
  validates :name, :nickname, :user_id, :master_image, presence: true
end