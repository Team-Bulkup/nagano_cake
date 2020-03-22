class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order_new = Order.new

  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to orders_confirm_path
  end

  def thanks
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:status, :payment_method, :postage, :charge, :postcode, :address, :name, :phone_number)
  end
end