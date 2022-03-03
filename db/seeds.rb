# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

domain_names = ["hotmail.com", "hotmail.ca", "yahoo.com", "yahoo.ca", "outlook.com", "outlook.ca", "gmail.com", "gmail.ca"]


10.times do
    Author.create(username: LiterateRandomizer.sentence(words: 2..3, punctuation: " ").split.join("-"), email: "#{LiterateRandomizer.sentence(words: 1, punctuation: "")}@#{domain_names[rand(0..7)]}")
end

100.times do
    Article.create(
        author_id: rand(1..10),
        title: LiterateRandomizer.sentence(:words => 5),
        body: LiterateRandomizer.paragraph,
    )
end
