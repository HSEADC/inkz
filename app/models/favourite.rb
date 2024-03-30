class Favourite < ApplicationRecord
  belongs_to :tattoo
  belongs_to :user
end
