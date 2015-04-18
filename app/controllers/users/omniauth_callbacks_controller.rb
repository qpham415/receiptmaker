class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      user_provider = @user.provider

      case user_provider
      when "google_oauth2"
        set_flash_message(:notice, :success, :kind => "google") if is_navigational_format?
      else
        set_flash_message(:notice, :success, :kind => @user.provider) if is_navigational_format?
      end

    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :twitter, :all
  alias_method :google_oauth2, :all
  alias_method :linkedin, :all
  alias_method :facebook, :all
end
