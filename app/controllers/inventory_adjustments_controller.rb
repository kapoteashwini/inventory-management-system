class InventoryAdjustmentsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @adjustment = InventoryAdjustment.new
  end

  def create
    @product = Product.find(params[:product_id])
    @adjustment = @product.inventory_adjustments.new(adjustment_params)

    if @adjustment.save
      if @adjustment.increase?
        @product.increase_stock(@adjustment.quantity)
      elsif @adjustment.decrease?
        @product.decrease_stock(@adjustment.quantity)
      end
      redirect_to @product, notice: 'Inventory adjustment was successfully recorded.'
    else
      render :new
    end
  end

  private

  def adjustment_params
    params.require(:inventory_adjustment).permit(:quantity, :adjustment_type)
  end
end
