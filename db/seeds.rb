# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Create a main sample user.
User.create!(name: "Juliana Caldeira Thome",
             email: "juju1thome@gmail.com",
             password: "julianaperfect",
             password_confirmation: "julianaperfect",
             admin: true,
            activated: true,
            activated_at: Time.zone.now) # Completing the idea that this user is perferct LOL
# Generate a bunch of additional users.
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@fakeemail.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end
