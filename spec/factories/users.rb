FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "joe_#{n}@hotmail.com" }
    password "password"
    name     "joe"
  end
end
