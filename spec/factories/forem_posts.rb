FactoryGirl.define do
  factory :forem_post, class: Forem::Post do
    association :topic, factory: :forem_topic
    association :user
    text "post body"
  end
end