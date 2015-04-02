class AddAttributesToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :from_address, :text
    add_column :receipts, :to_address, :text
    add_column :receipts, :payable, :text
  end
end
