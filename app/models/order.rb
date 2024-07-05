class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_one :invoice
  has_one :packing_slip

  # Define order status options (pending, fulfilled, shipped, delivered, etc.)
  enum status: {
    pending: 'pending',
    fulfilled: 'fulfilled',
    shipped: 'shipped',
    delivered: 'delivered'
  }
end
