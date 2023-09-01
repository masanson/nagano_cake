class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to admin_addresses_path
    else
      @addresses = Address.
      render :index
    end
  end

  def edit
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
