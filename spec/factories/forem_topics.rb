FactoryGirl.define do
  factory :forem_topic, class: Forem::Topic do
    association :user
    subject "a topic"
  end
end