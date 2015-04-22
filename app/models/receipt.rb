class Receipt < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  validates_presence_of :date, :from_address, :to_address
  validate :date_is_date?

  accepts_nested_attributes_for :line_items, :allow_destroy => :true, reject_if: lambda {|attributes| attributes['qty'].blank?}

  has_attached_file :logo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  private
    def date_is_date?
      if !date.is_a?(Date)
        errors.add(:date, 'must be a valid date')
      end
    end

end
