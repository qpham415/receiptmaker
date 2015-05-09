require 'spec_helper'
require 'rails_helper'


describe ReceiptsController do
  login_user

  it "should have a current_user" do
    expect(subject.current_user).to_not be_nil
  end

  it "should get index" do
    get 'index'
    expect(response).to be_success
  end
end
