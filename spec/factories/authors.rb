domain_names = ["hotmail.com", "hotmail.ca", "yahoo.com", "yahoo.ca", "outlook.com", "outlook.ca", "gmail.com", "gmail.ca"]

FactoryBot.define do
  factory :author do
    username { LiterateRandomizer.sentence(words: 2..3, punctuation: " ").split.join("-") }
    email { "#{LiterateRandomizer.sentence(words: 1, punctuation: "")}@#{domain_names[rand(0..7)]}" }
  end
end 
