class Tattoo < ApplicationRecord
  belongs_to :master
  mount_uploader :tattoo_image, TattooImageUploader
end