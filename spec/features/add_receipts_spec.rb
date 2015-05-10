require 'rails_helper'
require 'spec_helper'

RSpec.feature "AddReceipts", :type => :feature do
  before(:each) do
    User.create(:email => 'user@example.com', :password => 'password')
  end

  it "should create a new receipt with a logged in user" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end

    click_button 'Log in'

    visit new_receipt_path
    # puts page.body

    within "#new_receipt" do
      fill_in "datepicker", with: "2015-05-06"
      fill_in "receipt_from_address", with: "test"
      fill_in "receipt_to_address", with: "test"
    end

    click_link_or_button "Create Receipt"

    expect( Receipt.count ).to eq(1)

  end
end
