class Master < ApplicationRecord
    belongs_to :user
    validates_uniqueness_of :user_id
    has_many :tattoos
end
