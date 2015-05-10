FactoryGirl.define do
  factory :admin do |f|
    f.email { Faker::Internet.email }
    f.password "password"
    f.password_confirmation "password"
  end

end
