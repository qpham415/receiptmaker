class LineItemsController < ApplicationController
  def create
    @receipt = Receipt.find(params[:receipt_id])
    @line_item = @receipt.line_items.create(line_item_params)
    redirect_to receipt_path(@receipt)
  end

  def destroy
    @receipt = Receipt.find(params[:receipt_id])
    @line_item = @receipt.line_items.find(params[:id])
    @line_item.destroy
    redirect_to receipt_path(@receipt)
  end

  private
    def line_item_params
      params.require(:line_item).permit(:quantity, :description, :unit_price, :line_total, :_destroy)
    end
end
