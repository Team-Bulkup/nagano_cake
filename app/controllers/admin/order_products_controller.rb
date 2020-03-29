class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product_status = params[:order_product][:status]
    @order_product.update(status: @order_product_status)
    @order_product.order.order_products.each.with_index(1) do |order_product, i|
      unless order_product.status == "finishmaking"
        break
      end
      if i == @order_product.order.order_products.length
        @order_product.order.update(status: "sentready")
      end
    end
    if @order_product_status == "making"
        @order_product.order.update(status: "making")
    end
    redirect_to admin_order_path(@order_product.order.id)
  end

  protected
  def order_product_params
    params.require(:order_product).permit(:status)
  end
end
