require 'spec_helper'
require 'rails_helper'

describe LineItem do
  it "has a valid factory" do
    expect(FactoryGirl.create(:line_item)).to be_valid
  end
  it "is invalid without qty" do
    expect(FactoryGirl.build(:line_item, qty: nil)).to_not be_valid
  end
  it "is invalid without unit_price" do
    expect(FactoryGirl.build(:line_item, unit_price: nil)).to_not be_valid
  end
end
