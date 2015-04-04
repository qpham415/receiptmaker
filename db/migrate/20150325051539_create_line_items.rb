class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :qty
      t.text :description
      t.string :unit_price
      t.string :line_total

      t.references :receipt, index: true

      t.timestamps null: false
    end
    add_foreign_key :line_items, :receipts
  end
end
