class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def decrease_stock(quantity)
    update(quantity: self.quantity - quantity)
  end

  def increase_stock(quantity)
    update(quantity: self.quantity + quantity)
  end

  def low_stock_alert_level
    # Define your low stock threshold, e.g., 10 items remaining
    20
  end

  def low_stock?
    quantity <= low_stock_alert_level
  end
end
