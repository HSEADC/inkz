class Tattoo < ApplicationRecord
  belongs_to :master
  belongs_to :user, optional: true

  mount_uploader :tattoo_image, TattooImageUploader

  acts_as_taggable_on :tags
  acts_as_taggable_on :styles

  validates :title, :tattoo_image, presence: true
end
