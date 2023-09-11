class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_detials, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfar: 1 }

end
