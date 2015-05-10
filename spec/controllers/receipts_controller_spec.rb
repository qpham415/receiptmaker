require 'spec_helper'
require 'rails_helper'


describe ReceiptsController do
  login_user


  it "should have a current_user" do
    expect(subject.current_user).to_not be_nil
  end

  describe "get #index" do
    it "displays the index page" do
      get :index
      expect( response ).to render_template( :index )
    end
  end

end
