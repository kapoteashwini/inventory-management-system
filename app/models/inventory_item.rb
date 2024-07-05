# app/models/inventory_item.rb
class InventoryItem < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items
end
