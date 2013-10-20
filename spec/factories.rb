FactoryGirl.define do
  factory :user do
    name     "Eddy"
    email    "eddy@example.com"
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end
