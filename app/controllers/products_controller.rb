class ProductsController < ApplicationController
  def index
  	@categories = Category.all
  	@products = Product.page(params[:page]).reverse_order
  end

  def show
  	@categories = Category.all
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new
  end
end
