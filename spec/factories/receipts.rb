require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password "password"
    f.password_confirmation "password"
  end
  factory :receipt do |f|
    f.date { Faker::Date.backward(14) }
    f.from_address { Faker::Address.street_address }
    f.to_address { Faker::Address.street_address }
  end
  factory :invalid_receipt, parent: :receipt do |f|
    f.date nil
  end
end
