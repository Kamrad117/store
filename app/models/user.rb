class User < ActiveRecord::Base
  has_many :orders
  has_one :cart, dependent: :destroy
  enum role: { guest: 0, user: 1, moderator: 2, admin: 3 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
