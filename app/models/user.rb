class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_one :master, dependent: :destroy
  has_many :tattoos, dependent: :destroy

  has_many :favourites
  has_many :tattoos_i_favourited, through: :favourites, source: 'tattoo'

  def is_master?
    is_master
  end
end
