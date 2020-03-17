class RemoveCategoriesIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :categories_id, :integer
  end
end
