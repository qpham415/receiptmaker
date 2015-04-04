class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.date :date
      t.string :work_order_id
      t.text :image_link
      t.text :from_address
      t.text :to_address
      t.text :job_description
      t.string :subtotal
      t.string :taxes
      t.string :total
      t.text :payable

      t.timestamps null: false
    end
  end
end
