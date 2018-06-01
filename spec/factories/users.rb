FactoryBot.define do
  factory :user do
  	sequence(:email) { |n| "tester#{n}@mail.com" }
  	password "000000"
  end
end