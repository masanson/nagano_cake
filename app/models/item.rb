class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  has_one_attached :sweets_image

  def with_tax_price
    (price * 1.1).floor
  end

  def is_on_sale_status
    if is_on_sale == true
      "販売中"
    else
      "販売停止中"
    end
  end

  def get_sweets_image(width, height)
    unless sweets_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      sweets_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    sweets_image.variant(resize_to_limit: [width, height]).processed
  end
end
