class AddLogoToReceipts < ActiveRecord::Migration
  def self.up
    add_attachment :receipts, :logo
  end

  def self.down
    remove_attachment :receipts, :logo
  end
end
