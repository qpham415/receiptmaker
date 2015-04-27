class ReceiptsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @receipts = current_user.receipts.all
  end

  def show
    @receipt = current_user.receipts.find(params[:id])
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
    @receipt = current_user.receipts.build
    @line_item = @receipt.line_items.build
  end

  def create
    @receipt = current_user.receipts.build(receipt_params)

    if (@receipt.remove_logo == '0' && @receipt.new_logo == '0') || (@receipt.remove_logo == '0' && @receipt.new_logo == '1' && @receipt.logo.blank?)
      @receipt.logo = current_user.default_logo
    end

    @receipt.save

    if @receipt.save
    @line_item = @receipt.line_items.create(line_item_params)
    redirect_to @receipt
    else
    render 'new'
    end

  end

  def edit
    @receipt = current_user.receipts.find(params[:id])
    @line_item = @receipt.line_items.build
  end

  def update
    @receipt = current_user.receipts.find(params[:id])

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

    def logo_params
      params.permit!
    end

end
