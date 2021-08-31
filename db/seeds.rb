# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

puts "Resetting database"
Booking.destroy_all
Dress.destroy_all
User.destroy_all

# creating test user
puts 'Creating 1 test user... pass testing'
User.create!(
  email: "testing@testing.com",
  username: "testing",
  password: "testing"
)
puts 'TEST users created!'

# creating users
puts 'Creating 10 fake users...'
10.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Name.name,
    password: "password"
  )
end
puts 'Fake users created!'

dresses_urls = [
  "https://res.cloudinary.com/dihbvquux/image/upload/v1630364012/Dress-to-Impress/white-dress_uuuqii.jpg",
  "https://res.cloudinary.com/dihbvquux/image/upload/v1630363979/Dress-to-Impress/summer-dress_fifedu.jpg",
  "https://res.cloudinary.com/dihbvquux/image/upload/v1630363978/Dress-to-Impress/black-dress_yahqoj.jpg",
  "https://res.cloudinary.com/dihbvquux/image/upload/v1630363874/Dress-to-Impress/blue_dress_jqmugv.jpg",
  "https://res.cloudinary.com/dihbvquux/image/upload/v1630363874/Dress-to-Impress/green_dress_r26dyu.jpg",
  "https://res.cloudinary.com/dihbvquux/image/upload/v1630364150/Dress-to-Impress/red-dress_telq6x.jpg"
]
puts 'Creating 10 dresses with reviews'
addresses = [
  "5 Raphael St, London SW7 1DL",
  "Block C, 24 Stoneway Walk, London E3 5SH", "7, 1-3 North Road, London N7 9HA",
  "Ariel Way, London W12 7GF",
  "41 Tranquil Vale, Blackheath, London SE3 0BU",
  "86 London Rd, London SE23 3PE",
  "Greaves Pl, London SW17 0NE",
  "49 Broseley Grove, London SE26 5LD"
]
10.times do
  dress = Dress.create!(
    user: User.all.sample,
    title: "#{Faker::Color.color_name.capitalize} dress",
    brand: Faker::Company.name,
    address: addresses.sample,
    price: rand(10..100),
    size: [8, 10, 12, 14, 16, 18].sample,
    description: Faker::ChuckNorris.fact
    )
  rand(0..3).times do
    file = URI.open(dresses_urls.sample)
    dress.photos.attach(io: file, filename: 'photo.jpg')
  end
  # creating random reviews
  rand(2..4).times do
    review = Review.create!(
    rating: rand(1..5),
    content: Faker::Hipster.paragraph(sentence_count: 2),
    dress: dress,
    user: User.all.sample
    )
  end
end

# creating bookings
puts 'Creating 20 fake bookings...'
20.times do
  Booking.create(
    start_date: DateTime.now,
    end_date: DateTime.now + 1,
    user: User.all.sample,
    dress: Dress.all.sample,
    confirmed: [true, false].sample
  )
end
puts 'Finished!'

