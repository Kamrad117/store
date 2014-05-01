class Delivery < ActiveRecord::Base
  has_many :orders

  validate :name, presence: true
  validate :description, presence: true

  def available
    all
  end
end
