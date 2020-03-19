class ProductsController < ApplicationController
  def index
  	@categories = Category.all
  	@products = Product.all
  	# gem "kaminari" を入れたら、下の記述に変更。
  	# @products = Product.page(params[:page]).reverse_order
  end

  def show
  end
end
