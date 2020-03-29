class OrderProduct < ApplicationRecord
  belongs_to :order
  enum status:{impossible:0, waitmake:1, making:2, finishmaking:3}
end
