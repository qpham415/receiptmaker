class ReceiptsController < ApplicationController
  def welcome
  end

  def index
    @receipts = Receipt.all

  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  def new
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @receipt.save
    redirect_to @receipt
  end

  def update
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

end
