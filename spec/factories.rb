FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "Password"
    password_confirmation "Password"
  end

  factory :post do
    user
    subject "How to write a blog in Rails"
    content "There are a lot of steps"
  end
end