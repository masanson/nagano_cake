class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
    end
  end
  
  def update
    
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
