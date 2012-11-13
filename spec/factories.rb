FactoryGirl.define do
  factory :user do
    name "Test User"
    email "user@example.com"
    password "Password"
    password_confirmation "Password"
  end

  factory :post do
    user
    subject "How to write a blog in Rails"
    raw_content "There are a lot of steps"
  end
end