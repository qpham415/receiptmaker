class LineItem < ActiveRecord::Base
  belongs_to :receipt

  validates_presence_of :qty, :unit_price
end
