class Category < ActiveRecord::Base
  has_many :products
  has_many :brands, through: :products

  validate :name, presence: true, uniqueness: true

end
