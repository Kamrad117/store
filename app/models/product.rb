class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand

  validate :name, presence: true
  validate :description, presence: true
  validate :price, presence: true

end
