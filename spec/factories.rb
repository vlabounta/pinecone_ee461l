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

  factory :workflow do
    title       "Legal documentation"
    description "Sign all forms"
    user
  end

  factory :task do
    title       "I9"
    description "Fill this out!"
    workflow
  end

  factory :message do
    content     "This is the content of a message"
    from        "eddy@pinecone.com"
    task
  end
end
