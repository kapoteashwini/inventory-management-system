class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
    @inventory_items = InventoryItem.all
  end
end
