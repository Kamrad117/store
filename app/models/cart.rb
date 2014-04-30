class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :products, through: :line_items

  validate :user_id, presence: true

  def empty
    line_items.delete_all
  end

  def add_product(product)
     current_item = line_items.find_by_product_id(product.id)
     if current_item
       current_item.quantity += 1
     else
       current_item = line_items.build(:product_id => product.id, quantity: 1)
     end
     current_item
  end

  def total_price
    line_items.map{ |i| i.price }.inject { |sum, price| sum + price  }
  end

end

