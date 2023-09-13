class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_detials, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfar: 1 }
  
  def shipping_charge
    800
  end
  
  # def item_sum
  #   @order_detial.sum(:amount)
  # end
  
end
