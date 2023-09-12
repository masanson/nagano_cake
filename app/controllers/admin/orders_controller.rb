class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detials = @order.order_detials.all
  
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_charge, :total_amount, :payment_method, :customer_id)
  end

  def order_detial_params
    params.require(:order_detial).permit(:item_id, :order_id, :amount, :price)
  end

end
