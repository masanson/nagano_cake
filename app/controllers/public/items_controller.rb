class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
  
  private
  
  def item_params
    params.require(:item).permit(:sweets_image, :name, :introduction, :genre_id, :price, :is_on_sale )
  end
  
end
