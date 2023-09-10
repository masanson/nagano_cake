class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def check
    @order = Order.new(order_params)
    if params[:order][:select_address] == 0
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == 1
      @address = Address.find_by(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == 2
    end
    render :check
    @check_orders = current_customer.orders
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
