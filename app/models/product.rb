class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand
  has_many :assets, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :assets, allow_destroy: true,
                                :reject_if => lambda { |attributes| attributes[:image].blank? }

  validate :name, presence: true
  validate :description, presence: true
  validate :price, presence: true

end
