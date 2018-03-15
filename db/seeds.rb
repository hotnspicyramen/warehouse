# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "The Dude",
             email: "thedude@abides.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end


users = User.order(:created_at).take(6)
50.times do
  name = Faker::Seinfeld.character
  description = Faker::Seinfeld.quote
  price = rand(1.00...100.00)
  quantity = rand(1..25)
  region = rand(1..7)

  users.each { |user| user.products.create!(name: name,
                                            description: description,
                                            price: price,
                                            quantity: quantity,
                                            region: region)}
end