class Product < ApplicationRecord
  has_many :customers,  through: :cart_items
  belongs_to :category

  attachment :image

	validates :image, presence: true
	validates :name, presence: true
	validates :detail, presence: true
	validates :category_id, presence: true
	validates :no_tax_price, presence: true
	validates :is_available, presence: true

end