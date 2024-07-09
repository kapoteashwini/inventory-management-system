class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  has_many :order_items
  has_one :invoice
  has_one :packing_slip

  enum status: { pending: 0, confirmed: 1, shipped: 2, delivered: 3, cancelled: 4 }

  validate :product_quantity_available
  after_create :update_product_quantities

  private

  def product_quantity_available
    order_items.each do |item|
      product = item.product
      if product.quantity < item.quantity
        errors.add(:base, "Not enough stock for #{product.name}")
      end
    end
  end

  def update_product_quantities
    order_items.each do |item|
      product = item.product
      product.update(quantity: product.quantity - item.quantity)
    end
  end

end
