FactoryBot.define do
  factory :user do
  sequence(:email) { |n| "user#{n}@email.com" }
    password '123123'
    password_confirmation '123123'
  end
end
