class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
  
  private
  
  def item_params
    params.require(:item).permit(:sweets_image, :name, :introduction, :genre_id, :price, :is_on_sale )
  end
  
end
