FactoryGirl.define do
  factory :proposal do
    title "A Tale of Two Cities"
    speaker_name "John Doe"
    description "A fascinating account of these two cities"
    email "user@example.com"
    bio "I'm an expert on these two different locales"

    trait :selected do
      selected true
    end
  end
end
