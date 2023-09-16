class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @total = 0
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_charge, :total_amount, :payment_method, :customer_id)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :price)
  end

end
