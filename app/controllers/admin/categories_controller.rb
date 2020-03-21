class Admin::CategoriesController < ApplicationController
  def index
  	@categories = Category.all
  	@category = Category.new
  end

  def create
  	@categories = Category.all
  	@category = Category.new(category_params)
  	if @category.save
  		flash[:success] = "Category was successfully added."
  		redirect_to admin_categories_path
  	end
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	@category = Category.find(params[:id])
  	if @category.update(category_params)
  		redirect_to admin_categories_path, notice: "Category was successfully updated."
  	else
  		render "edit"
  	end
  end

  private

  def category_params
  	params.require(:category).permit(:name, :is_enable)
  end
end