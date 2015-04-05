class LineItemsController < ApplicationController
  def index
    @line_items = LineItem.all
  end

  def show
    @line_item = LineItem.find(params[:id])
  end

  def new
    @line_item = LineItem.new
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def create
    @line_item = LineItem.new(params[:line_item])
  end

  def update
    @line_item = LineItem.find(params[:id])
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
  end

  private
    def line_item_params
      params.require(:line_item).permit(:quantity, :description, :unit_price, :line_total, :_destroy)
    end
end
