FactoryGirl.define do
  factory :profile do
    user_id { user.id }
  end
end
