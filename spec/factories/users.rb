FactoryGirl.define do
  factory :user do
    password "test1234"
    password_confirmation { password }
  end
end
