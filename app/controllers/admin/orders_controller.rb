class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def customer_index
    @customer = Customer.find(params[:customer_id])
  end

  def show
    @order = Order.find(params[:id])
    @order_product = @order.order_products.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end
  protected
  def order_params
    params.require(:order).permit(:status)
  end
end
