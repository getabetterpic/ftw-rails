FactoryGirl.define do
  factory :person do
    email FFaker::Internet.email
    password 'password'
    password_confirmation 'password'
  end
end