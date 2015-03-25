class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.text :description
      t.float :unit_price
      t.float :line_total

      t.references :receipt, index: true

      t.timestamps null: false
    end
    add_foreign_key :line_items, :receipts
  end
end
