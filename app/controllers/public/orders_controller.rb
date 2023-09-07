class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def check
    @order = Order.new(order_params)
    if @order.save
      redirect_to complition_public_orders_path
    else
      render :new
    end
  end
  
  def complition
    
  end
  
  def create
    
  end
  
  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_charge, :total_amount, :payment_method, :customer_id)
  end
end
