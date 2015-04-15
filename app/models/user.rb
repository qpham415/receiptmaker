class User < ActiveRecord::Base
  has_many :receipts
  # Include default devise modules. Others available are:
  # :lockable, :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable, :omniauthable

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.provider = auth.provider
     user.uid = auth.uid
     user.email = auth.info.email
   end
  end

  def self.new_with_session(params, session)
   if data = session["devise.user_attributes"]
     new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
     end
   else
     super
   end
  end

  def password_required?
      super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

end
