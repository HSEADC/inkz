class Master < ApplicationRecord
    has_many :tattoos
    belongs_to :user
end
