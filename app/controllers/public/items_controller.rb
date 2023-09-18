class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  private
  
  def item_params
    params.require(:item).permit(:sweets_image, :name, :introduction, :genre_id, :price, :is_on_sale )
  end
  
end
