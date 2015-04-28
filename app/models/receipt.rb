class Receipt < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  accepts_nested_attributes_for :line_items, :allow_destroy => :true, reject_if: lambda {|attributes| attributes['qty'].blank?}

  validates_presence_of :date, :from_address, :to_address
  validate :date_is_date?

  has_attached_file :logo,
    styles: {
      thumb: '100x100>'
    }

  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  attr_accessor :remove_logo, :new_logo
  before_save { self.logo.clear if (remove_logo == '1' && new_logo == '0') || (remove_logo == '1' && new_logo == '1' && logo.blank?) }


  private
    def date_is_date?
      if !date.is_a?(Date)
        errors.add(:date, 'must be a valid date')
      end
    end

end
