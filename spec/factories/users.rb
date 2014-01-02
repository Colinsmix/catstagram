# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "meow#{n}@kitty.com" }
    password "meow1234"
    password_confirmation "meow1234"
  end
end
