class ProductsController < ApplicationController
  def index
  	# この記述でジャンルステータスが有効のカテゴリーのみ表示
	 	@categories = Category.where(is_enabled: true)

		@products = []

		@categories.each do |category|
			category.products.each do |product|
				if product.is_available == true
					@products << product
				end
			end
		end
  end

  def show
  	# この記述でジャンルステータスが有効のカテゴリーのみ表示
	 	@categories = Category.where(is_enabled: true)
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new
  end
end