class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def check
    @order_new = Order.new
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total = 0
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
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detial = OrderDetial.new
      @order_detial.item_id = cart_item.item.id
      @order_detial.price = cart_item.item.with_tax_price
      @order_detial.amount = cart_item.amount
      @order_detial.order_id = @order.id
      @order_detial.save
    end
    @cart_items.delete_all
    redirect_to complition_public_orders_path
  end

  def complition

  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @orders = @order.order_detials.all
    @total = 0
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_charge, :total_amount, :payment_method, :customer_id)
  end

  # def order_detial_params
  #   params.require(:order_detial).permit(:item_id, :order_id, :amount, :price)
  # end

end
