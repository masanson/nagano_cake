class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @customer = current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item = Cartitem.update(cart_item_params)
  end

  def destroy

  end

  def empty

  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
