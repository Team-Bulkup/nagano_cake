class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :categories_id
      t.string :name
      t.integer :no_tax_price
      t.text :detail
      t.string :image_id
      t.boolean :is_available, default: false, null: false
      t.timestamps
    end
  end
end
