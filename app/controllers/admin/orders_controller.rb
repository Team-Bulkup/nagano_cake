class Admin::OrdersController < ApplicationController
  def index
      @orders = Order.all
  end

  def customer_index
    @customer = Customer.find(params[:customer_id])
  end

  def show
  end

  def update
  end
end
