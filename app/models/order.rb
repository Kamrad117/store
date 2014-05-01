class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items , dependent: :destroy
  has_many :products, through: :line_items
  belongs_to :delivery

  validate :price, presence: true
  validate :user_id, presence: true
  validate :cell_phone, presence: true

  def get_items(cart)
    self.price = cart.total_price
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
