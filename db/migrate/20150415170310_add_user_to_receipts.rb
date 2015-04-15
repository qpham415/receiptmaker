class AddUserToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :user_id, :string
  end
end
