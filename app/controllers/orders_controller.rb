class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @orders = current_customer
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    current_customer.cart_items.each do |f|
      op = OrderProduct.new(name: f.product.name , quantity: f.quantity , price: f.quantity * f.product.no_tax_price * 1.1, order_id: order.id , status: "impossible")
      op.save
      f.destroy
    end
    redirect_to orders_thanks_path
  end

  def thanks
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name ,:charge)
  end
end