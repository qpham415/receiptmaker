require 'faker'

FactoryGirl.define do
  factory :line_item do |f|
    f.qty { Faker::Number.number(2) }
    f.unit_price { Faker::Number.number(2)}
  end
end
