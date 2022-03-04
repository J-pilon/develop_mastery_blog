FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "username#{n}" }
    sequence(:email) {|n| "person#{n}@example.com"}
  end
end 
