class Admin::HomesController < ApplicationController
  
  def top
    @orders = Order.all
    @order_detials = OrderDetial.all
    # @orders_item_sum = @order_detials.item_sum
  end
  
end
