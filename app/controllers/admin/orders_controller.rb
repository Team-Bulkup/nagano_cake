class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def customer_index
    @customer = Customer.find(params[:customer_id])
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  def update
    @order = Order.find(params[:id])
    @order_status = params[:order][:status]
    @order.update(status: @order_status)

    if @order_status == "waitmoney"
        @order.order_products.update(status: "impossible")
    elsif @order_status == "moneycheck"
        @order.order_products.update(status: "waitmake")
    end
    redirect_to admin_order_path(@order)
  end
  protected
  def order_params
    params.require(:order).permit(:status)
  end
end
