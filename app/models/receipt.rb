class Receipt < ActiveRecord::Base
  has_many :line_items
  accepts_nested_attributes_for :line_items, :allow_destroy => :true, reject_if: lambda {|attributes| attributes['qty'].blank?}
end
