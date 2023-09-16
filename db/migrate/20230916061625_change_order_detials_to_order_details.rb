class ChangeOrderDetialsToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    rename_table :order_detials, :order_details
  end
end
