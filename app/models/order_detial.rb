class OrderDetial < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def subtotal
    price * amount
  end

  def item_sum
    @order_detial.sum(:amount)
  end

end
