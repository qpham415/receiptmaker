class Receipt < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  validates_presence_of :date, :from_address, :to_address
  validate :date_is_date?

  accepts_nested_attributes_for :line_items, :allow_destroy => :true, reject_if: lambda {|attributes| attributes['qty'].blank?}

  private
    def date_is_date?
      if !date.is_a?(Date)
        errors.add(:date, 'must be a valid date')
      end
    end

end
