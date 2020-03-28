class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product_status = params[:order_product][:status]
        @order_product.update(status: @order_product_status)

        if @order_product_status == "making"
            @order_product.order.update(status: "making")
        elsif @order_product_status == "finishmaking"
            @order_product.order.update(status: "sentready")
        end
      redirect_to admin_order_path(@order_product.order.id)
  end
  protected
  def order_product_params
    params.require(:order_product).permit(:status)
  end
end
