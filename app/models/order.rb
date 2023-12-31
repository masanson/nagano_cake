class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  
  enum payment_method: { credit_card: 0, transfar: 1 }
  
  def shipping_charge
    800
  end
  
end
