require 'test_helper'

class ReceiptsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  include Devise::TestHelpers

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end
end
