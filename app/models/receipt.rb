class Receipt < ActiveRecord::Base
  has_many :line_items
  validates_presence_of :date, :from_address, :to_address

  accepts_nested_attributes_for :line_items, :allow_destroy => :true, reject_if: lambda {|attributes| attributes['qty'].blank?}
end
