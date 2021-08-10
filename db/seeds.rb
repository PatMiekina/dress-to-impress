# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

# 10.times do
#   password = Faker::Internet.password
#   user = User.new(username: Faker::Internet.username, email: Faker::Internet.email, password: password, password_confirmation: password, photo: Faker::LoremPixel.image(size: "300x300", is_gray: false, category: 'people'))
#   user.skip_confirmation!
#   user.save!
#   2.times do
#     price[10..100].sample
#     size = [8, 10, 12, 14, 16, 18].sample
#     dress = Dress.new(title: "#{Faker::Commerce.color} dress", brand: Faker::Company.name,description: Faker::Lorem.sentences(number: 1), photo: Faker::LoremPixel.image(size: "400x400", is_gray: false, category: 'fashion'), price: price, size: size)
#     dress.user = user
#     dress.save
#   end
# end
