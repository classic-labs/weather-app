FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" } # ensure factory users have unique emails
    password { "securepassword123" }
  end
end
