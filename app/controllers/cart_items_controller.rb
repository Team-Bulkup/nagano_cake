class CartItemsController < ApplicationController
  def index
   @products = Product.all
  end

  def create
    if params[:][:] ==
       product = Products.find(params[:id])
       product.save
       redirect_to cart_items_path
     else

       cart = CartItems.New
       cart.save
       redirect_to new_order_path
  end

  def destroy
    @products = CartItems.find(params[:id])
    @products.destroy
    redirect_to cart_items_path
  end

  def destroy_all
  end

  def update
  end

  private

  def cart_params
    params.require(:cart).permit(:image, :name ,:no_tax_price)
  end
end
