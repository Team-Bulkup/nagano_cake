class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :status
      t.string :payment_method
      t.integer :postage
      t.integer :charge
      t.string :postcode
      t.string :address
      t.string :name
      t.string :phone_number
      t.timestamps
    end
  end
end
