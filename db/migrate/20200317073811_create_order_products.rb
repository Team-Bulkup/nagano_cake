class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.string :name
      t.integer :quantity
      t.integer :price
      t.integer :status
      t.timestamps
    end
  end
end
