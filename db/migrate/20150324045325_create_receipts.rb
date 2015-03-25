class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.datetime :date
      t.text :work_order_id
      t.text :image_link
      t.text :from_name
      t.text :from_address1
      t.text :from_address2
      t.text :from_city
      t.text :from_state
      t.text :from_zip
      t.text :from_phone
      t.text :from_fax
      t.text :from_email
      t.text :to_name
      t.text :to_company_name
      t.text :to_address1
      t.text :to_address2
      t.text :to_city
      t.text :to_state
      t.text :to_zip
      t.text :customer_id
      t.text :job_description
      t.float :subtotal
      t.float :taxes
      t.float :total

      t.timestamps null: false
    end
  end
end
