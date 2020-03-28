class CategoriesController < ApplicationController
  def index
  	# この記述でジャンルステータスが有効のカテゴリーのみ表示
	 	@categories = Category.where(is_enabled: true)
  	if params[:category_id]
		 	@category = Category.find(params[:category_id])
			@products = Product.where(category_id: params[:category_id]).page(params[:page])
	  end
  end
end