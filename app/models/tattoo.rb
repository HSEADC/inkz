class Tattoo < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title]

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :master
  belongs_to :user, optional: true

  has_many :favourites
  has_many :users_who_favourited, through: :favourites, source: 'user'

  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user

  mount_uploader :tattoo_image, TattooImageUploader

  acts_as_taggable_on :parts
  acts_as_taggable_on :styles

  validates :title, presence: true
  validates :tattoo_image, presence: true

  # self.per_page = 28
end
