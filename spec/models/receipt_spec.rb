# spec/models/receipt.rb
require 'spec_helper'
require 'rails_helper'

describe Receipt do
  it "has a valid factory" do
    expect(FactoryGirl.create(:receipt)).to be_valid
  end
  it "is invalid without a date" do
    expect(FactoryGirl.build(:receipt, date: nil)).to_not be_valid
  end
  it "is invalid without a from_address" do
    expect(FactoryGirl.build(:receipt, from_address: nil)).to_not be_valid
  end
  it "is invalid without a to_address" do
    expect(FactoryGirl.build(:receipt, to_address: nil)).to_not be_valid
  end
  it "does not allow improper date" do
    expect(FactoryGirl.build(:receipt, date: "some date")).to_not be_valid
  end
end
