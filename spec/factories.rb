FactoryGirl.define do
  factory :user do
    name "John"
    last_name  "Doe"
    email "test@email.com"
    password "password123"
  end

  factory :project do
    name "Test Project"
    description  "This is my test project"
  end
end