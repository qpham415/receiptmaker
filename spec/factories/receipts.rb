require 'faker'

FactoryGirl.define do
  factory :receipt do |f|
    f.date { Faker::Date.backward(14) }
    f.from_address { Faker::Address.street_address }
    f.to_address { Faker::Address.street_address }
  end
end
