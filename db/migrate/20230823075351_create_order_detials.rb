class CreateOrderDetials < ActiveRecord::Migration[6.1]
  def change
    create_table :order_detials do |t|

      t.integer :amount, null: false
      t.integer :price, null: false
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.timestamps
    end
  end
end
