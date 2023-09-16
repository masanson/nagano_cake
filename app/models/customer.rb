class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  def name
    first_name + ' ' + last_name
  end
  
  def name_kana
    first_name_kana + ' ' + last_name_kana
  end
  
  def is_deleted_status
    if is_deleted == false
      "有効"
    else
      "退会中"
    end
  end
  
end
