class HomeController < ApplicationController

  def index
    @categories = Category.all
    @products = @categories.map{|cat| cat.products.limit(1).first }
  end
end
