class Admin::OrderProductsController < ApplicationController
  def update
    @order_product = OrderProduct.find(params[:id])
    if @order_product.update(order_product_params)
      redirect_to admin_order_path(@order_product.order_id)
    else
      @order = Order.find(params[:id])
      render 'orders/show'
    end
  end
  protected
  def order_product_params
    params.require(:order_product).permit(:status)
  end
end
