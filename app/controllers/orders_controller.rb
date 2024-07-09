class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_manager!, only: [:edit, :update, :destroy]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @customers = Customer.all  # Assuming you have a Customer model
    @products = Product.all    # Load products here
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    binding.pry
    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      @customers = Customer.all
      @products = Product.all
      render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
      else
        @customers = Customer.all  # Reload customers for form re-rendering
        @products = Product.all    # Reload products for form re-rendering
        format.html { render :edit }
      end
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_id, :status, :total_amount, order_items_attributes: [:product_id, :quantity, :unit_price])
  end

  def authorize_manager!
    redirect_to(root_path, alert: 'You are not authorized to perform this action.') unless current_user.manager? || current_user.admin?
  end
end
