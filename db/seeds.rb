# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username:  "Alex Scott",
             email: "alex@alxs.co.uk",
             password:              "claire0567",
             password_confirmation: "claire0567",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(username:  "Alex",
             email: "alex.scott@tipsforthings.com",
             password:              "claire0567",
             password_confirmation: "claire0567",
             activated: true,
             activated_at: Time.zone.now)



99.times do |n|
  username  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username:  username,
               email: email,
               password:              password,
               password_confirmation: password)
end
