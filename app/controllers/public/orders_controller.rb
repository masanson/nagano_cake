class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def check
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total = 0
    @shipping_charge = 800
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find_by(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
  end
  
  def create
    @order = Order.new(order_params)
    @order_detial = OrderDetial.new(order_detial_params)
    @cart_items = current_customer.cart_items   
    @order_detial.price = @cart_items.item.with_tax_price
    @order_detial.amount = @cart_items.amount
    @order.shipping_charge = @shipping_charge
    
  end
  
  def complition

  end
  
  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_charge, :total_amount, :payment_method, :customer_id)
  end

  def order_detial_params
    params.require(:order).permit(:item_id, :order_id, :amount, :price)
  end

end
