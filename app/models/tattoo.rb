class Tattoo < ApplicationRecord
  belongs_to :master
  belongs_to :user, optional: true

  mount_uploader :tattoo_image, TattooImageUploader

  validates :title, presence: true
end
