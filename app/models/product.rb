class Product < ApplicationRecord
  has_many :customers,  through: :cart_items
  belongs_to :category
end
