# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    association :user
    image File.open(File.join(Rails.root, '/spec/support/fixtures/sleeping_cat.jpeg'))

    trait :with_description do
      sequence(:description) { |n| "Meet kitty#{n}. MEOWWW!" }
    end
  end
end
