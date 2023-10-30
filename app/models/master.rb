class Master < ApplicationRecord
  belongs_to :user
  has_many :tattoos, dependent: :destroy
end
