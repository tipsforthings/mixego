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
             admin: true,
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

# Microposts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..100]
followers = users[2..100]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

genres = ["Alternative Rock", 
          "Ambient",
          "Bounce", 
          "Classical", 
          "Country", 
          "Dance & EDM", 
          "Dancehall", 
          "Deep House", 
          "Disco", 
          "Drum & Bass", 
          "Dubstep", 
          "Electronic", 
          "Folk & Singer-Songwrites",
          "Hardcore", 
          "Hip Hop & Rap", 
          "House", 
          "Indie", 
          "Jazz & Blues", 
          "Latin", 
          "Metal",
          "Minimal", 
          "Piano", 
          "Pop", 
          "R&B", 
          "Reggae", 
          "Reggaeton", 
          "Rock", 
          "Soul", 
          "Soundtrack", 
          "Techno", 
          "Tech House",
          "Trance", 
          "Trap", 
          "Trip Hop", 
          "World"]
genres.each{|d| Genre.where(:name => d).first_or_create}

