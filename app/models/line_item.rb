class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  validate :quantity, presence: true

  def price
    product.price * quantity
  end

  def name
    product.name
  end
end
