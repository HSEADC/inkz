class Tattoo < ApplicationRecord
  belongs_to :master
  belongs_to :user

  mount_uploader :tattoo_image, TattooImageUploader
end