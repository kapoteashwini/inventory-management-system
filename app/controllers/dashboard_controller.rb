class DashboardController < ApplicationController
  before_action :authenticate_user!

def index
    @total_inventory_items = InventoryItem.count
    @total_inventory_value = InventoryItem.sum(:price)
    @recent_transactions = Transaction.last(5) # Example recent transactions
    @inventory_alerts = {
      low_stock: InventoryItem.where('quantity < ?', 10),
      overstock: InventoryItem.where('quantity > ?', 100),
      out_of_stock: InventoryItem.where(quantity: 0)
    }
    @top_performing_items = InventoryItem.order(quantity: :desc).limit(5) # Example top items by quantity

    @recent_orders = Order.last(5) # Fetch recent orders or adjust as per your model
    @total_orders = Order.count 
  end
end
