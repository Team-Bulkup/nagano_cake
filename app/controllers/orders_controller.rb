class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    @order.postcode = params[:order][:postcode]
    @order.name = params[:order][:name]
    @order.address = params[:order][:address]
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to orders_confirm_path
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:status, :payment_method, :postage, :charge, :postcode, :address, :name, :phone_number)
  end
end