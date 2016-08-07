FactoryGirl.define do
  factory :user do
    name 'TARO YAMADA'
    email {'yamada@example.com'}
    password 'password'
    password_confirmation 'password'
  end
end
