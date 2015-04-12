class ReceiptsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @receipts = Receipt.all
  end

  def show
    @receipt = Receipt.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "receipt_#{@receipt.work_order_id}",
        :template => 'receipts/print.html.erb',
        :layout => 'layouts/pdf.html.erb',
        :page_size => 'Letter'
      end
    end
  end

  def new
    @receipt = Receipt.new
    2.times{ @receipt.line_items.build }
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @receipt.save

    if @receipt.save
    @line_item = @receipt.line_items.create(line_item_params)
    redirect_to @receipt
    else
    render 'new'
    end

  end

  def edit
    @receipt = Receipt.find(params[:id])
    @line_item = @receipt.line_items.build
  end

  def update
    @receipt = Receipt.find(params[:id])
    if @receipt.update(receipt_params)
      redirect_to @receipt
    else
      render 'edit'
    end
  end

  def destroy
    @receipt = Receipt.find(params[:id])
    @receipt.destroy
    redirect_to receipts_path
  end

  private
    def receipt_params
      params.require(:receipt).permit!
    end

    def line_item_params
      params.permit(:quantity, :description, :unit_price, :line_total)
    end

end
