class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products, dependent: :destroy
  enum status:{waitmoney:0, moneycheck:1, making:2, sentready:3, finishsenting:4}
end
