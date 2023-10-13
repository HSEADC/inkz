class Master < ApplicationRecord
    belongs_to :user
    has_many :tattoos
end
