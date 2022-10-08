# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# 30.times do |n|
#   User.create!(
#     name: Faker::Internet.username,
#     email: Faker::Internet.email,
#     password: 'password',
#     password_confirmation: 'password'
#   )
# end

# 10.times do |n|
#   Content.create!(
#     title: Faker::Book.unique.title
#   )
# end

# 10.times do |n|
#   Favorite.create!(
#     name: Faker::Name.unique.name,
#     existence: 0,
#     decade: rand(0..7),
#     gender: rand(0..1),
#     job: rand(1..6),
#   )
# end

# Content.all.each do |content|
#   content.favorites.create!(
#     name: Faker::Name.unique.name,
#     existence: 1,
#     decade: rand(0..7),
#     gender: rand(0..1),
#   )
# end

# User.all.each do |user|
#   before = rand(1..20)
#   user.fans.create!(
#     favorite_id: before,
#     state: 0
#   )
#   user.fans.create!(
#     favorite_id: Array(1..20).slice(before),
#     state: 1
#   )
# end
