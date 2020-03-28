class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @products = Product.all
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product was successfully added."
      redirect_to admin_products_path
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path, notice: "Product was successfully updated."
    else
      render "edit"
    end
  end
  private

  def product_params
    params.require(:product).permit(:image, :name, :detail, :category_id, :no_tax_price, :is_available)
  end
end
