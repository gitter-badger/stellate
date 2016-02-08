FactoryGirl.define do
  factory :user do
    screen_name Faker::Internet.user_name nil, %w(_)
    password 'test123'
    email Faker::Internet.email
  end
end
