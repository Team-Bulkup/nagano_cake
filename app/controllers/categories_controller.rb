class CategoriesController < ApplicationController
  def index
	 	@categories = Category.all
	 	@category = Category.find(params[:category_id])
  	if params[:category_id]
			@products = Product.where(category_id: params[:category_id]).page(params[:page])
	  end
  end
end