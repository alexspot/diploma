FactoryGirl.define do
  factory :user do
    name "Foo"
    email "Foo@bar.com"
    password "1234567"
    password_confirmation "1234567"
  end
end