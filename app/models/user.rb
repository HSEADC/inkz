class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :master, dependent: :destroy #? нужно для того, чтобы удалять мастера, если удаляется пользователь?
  has_many :tattoos, dependent: :destroy #? нужно для того, чтобы удалять тату, если удаляется пользователь?

  def is_master?
    is_master
  end
end
