require 'rails_helper'
require 'spec_helper'

RSpec.feature "AddReceipts", :type => :feature do
  before(:each) do
    User.create(:email => 'user@example.com', :password => 'password')
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end

    click_button 'Log in'
    5.times { receipt = FactoryGirl.create(:receipt) }
  end

  it "signs in the user successfully" do
    expect(page).to have_content "Signed in successfully."
  end

  it "displays the index page" do
    expect(page).to have_css('.header_text', :text => 'Listings of All Receipts')
  end

  it "has a list of 5 receipts" do
    expect(Receipt.count).to eq(5)
  end

  it "creates a new receipt" do
    visit new_receipt_path
    within "#new_receipt" do
      fill_in "datepicker", with: Faker::Date.backward(14)
      fill_in "receipt_from_address", with: Faker::Address.street_address
      fill_in "receipt_to_address", with: Faker::Address.street_address
    end
    click_link_or_button "Create Receipt"
    expect( Receipt.count ).to eq(6)
  end

end
