class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items , dependent: :destroy
  has_many :products, through: :line_items
  belongs_to :delivery

  validate :price, presence: true
  validate :user_id, presence: true

  def add_line_items_from_the_cart(cart)
    price = cart.total_price
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
