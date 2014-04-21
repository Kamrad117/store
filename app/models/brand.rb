class Brand < ActiveRecord::Base
  has_many :products
  has_many :categories, through: :products

  validate :name, presence: true, uniqueness: true

end
