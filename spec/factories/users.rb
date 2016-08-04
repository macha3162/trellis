FactoryGirl.define do
  factory :user do
    name 'TARO YAMADA'
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end
