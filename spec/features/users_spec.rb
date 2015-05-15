require 'rails_helper'
require 'spec_helper'

RSpec.feature "Users", type: :feature do
  describe "User log in" do
    it "reject incorrect user information" do
      User.create(:email => 'user@example.com', :password => 'password')
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'password_wrong'
      end
      click_button 'Log in'
      expect(page).to have_css('.alert', :text => 'Invalid email or password.' )
    end

    it "sucessfuly sign in the user" do
      User.create(:email => 'user@example.com', :password => 'password')
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'Email', :with => 'user@example.com'
        fill_in 'Password', :with => 'password'
      end
      click_button 'Log in'
      expect(page).to have_css('.notice', :text => 'Signed in successfully.' )
    end
  end
  describe "User registration" do
    it "sucessfully creates a user" do
      visit '/users/sign_up'
      within("#new_user") do
        fill_in 'user_email', :with => 'user@example.com'
        fill_in 'user_password', :with => 'password'
        fill_in 'user_password_confirmation', :with => 'password'
      end
      click_button 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully.'

    end

    it "rejects user with incorrect infomation" do
      visit '/users/sign_up'
      within("#new_user") do
        fill_in 'user_email', :with => 'user@example.com'
        fill_in 'user_password', :with => 'password1'
        fill_in 'user_password_confirmation', :with => 'password'
      end
      click_button 'Sign up'
      expect(page).to have_css('#error_explanation')
    end
  end
end
