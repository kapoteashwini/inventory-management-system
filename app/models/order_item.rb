class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :inventory_item
end
