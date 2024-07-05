class InventoryItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, except: [:index, :show]
  before_action :set_inventory_item, only: [:show, :edit, :update, :destroy]

  def index
    @inventory_items = InventoryItem.all
  end

  def show
    @inventory_item = InventoryItem.find(params[:id])
    respond_to do |format|
      format.html # This will render show.html.erb by default
      format.js   # This will render show.js.erb for AJAX requests
    end
  end

  def new
    @inventory_item = InventoryItem.new
  end

  def create
    @inventory_item = InventoryItem.new(inventory_item_params)
    if @inventory_item.save
      redirect_to @inventory_item, notice: 'Inventory item was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @inventory_item.update(inventory_item_params)
      redirect_to @inventory_item, notice: 'Inventory item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @inventory_item.destroy
    redirect_to inventory_items_url, notice: 'Inventory item was successfully destroyed.'
  end

  private

  def set_inventory_item
    @inventory_item = InventoryItem.find(params[:id])
  end

  def inventory_item_params
    params.require(:inventory_item).permit(:name, :description, :quantity, :price)
  end

  def authorize_admin!
    redirect_to(root_path, alert: 'You are not authorized to perform this action.') unless current_user.admin?
  end
end
