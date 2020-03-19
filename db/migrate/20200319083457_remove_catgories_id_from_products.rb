class RemoveCatgoriesIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :catgories_id, :integer
  end
end
