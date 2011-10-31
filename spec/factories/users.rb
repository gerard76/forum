Factory.define :user do |f|
  f.sequence(:email) { |n| "joe_#{n}@hotmail.com" }
  f.password "password"
  f.name     "joe"
end