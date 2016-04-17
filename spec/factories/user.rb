FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password 'Password'
    password_confirmation 'Password'
  end
end
