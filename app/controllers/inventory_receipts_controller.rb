class InventoryReceiptsController < ApplicationController
  def new
    @inventory_receipt = InventoryReceipt.new
  end

  def create
    @inventory_receipt = InventoryReceipt.new(inventory_receipt_params)

    if @inventory_receipt.save
      redirect_to new_inventory_receipt_path, notice: 'Receipt recorded.'
    else
      render :new
    end
  end

  protected
  def inventory_receipt_params
    params.require(:inventory_receipt).permit(:title, :description, :quantity)
  end
end
