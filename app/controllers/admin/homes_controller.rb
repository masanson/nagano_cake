class Admin::HomesController < ApplicationController
  
  def top
    @orders = Order.all
    @order_detials = OrderDetial.all
  end
  
end
