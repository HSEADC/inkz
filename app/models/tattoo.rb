class Tattoo < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title]

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :master
  belongs_to :user, optional: true

  has_many :favourites
  has_many :users_who_favourited, through: :favourites, source: 'user'

  mount_uploader :tattoo_image, TattooImageUploader

  acts_as_taggable_on :parts
  acts_as_taggable_on :styles

  validates :title, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :tattoo_image, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :user_id, numericality: { only_integer: true }, allow_nil: true
  validates :master_id, presence: true

  # self.per_page = 28
end
