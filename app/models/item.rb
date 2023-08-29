class Item < ApplicationRecord
  belongs_to :genre
  
  has_one_attached :sweets_image
  
  def get_sweets_image(width, height)
    unless sweets_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      sweets_image.attach(io: File.open(file_path), filename: 'defauit-image.jpg', content_type: 'image/jpeg')
    end
    sweets_image.variant(resize_to_limit: [width, height]).processed
  end
end
