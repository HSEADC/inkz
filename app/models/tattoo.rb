class Tattoo < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :master
  belongs_to :user, optional: true

  has_many :favourites
  has_many :users_who_favourited, through: :favourites, source: 'user'

  mount_uploader :tattoo_image, TattooImageUploader

  acts_as_taggable_on :parts
  acts_as_taggable_on :styles

  validates :title, presence: true

  # self.per_page = 28
end
