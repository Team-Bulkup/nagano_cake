class CartItemsController < ApplicationController
  def index
   @carts = current_customer.cart_items
  end

  def create
       cart = CartItem.new(cart_params)
       cart.customer_id = current_customer.id
       cart.save
       redirect_to cart_items_path
  end

  def destroy
    @products = CartItem.find(params[:id])
    @products.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @items = current_customer.cart_items
    @items.each do |f|
    f.destroy
    end
    redirect_to products_path
  end

  def update
       cart_item = CartItem.find(params[:id])
       cart_item.quantity = params[:cart_items][:quantity]
       cart_item.update
       redirect_to cart_items_path
  end

  private

  def cart_params
    params.require(:cart_item).permit(:quantity ,:product_id)
  end
end
