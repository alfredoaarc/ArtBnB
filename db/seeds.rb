require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database'
Rental.destroy_all
Artwork.destroy_all
User.destroy_all
puts 'Database cleaned'

user = User.create(
  email: 'mail@mail.com',
  password: '123456'
)

locations = ['Madrid', 'Paris', 'New York', 'Santiago']
categories = ['Sculpture', 'Painting', 'Art Installation', 'Immersive Art']

puts 'Seeding 30 new artworks'
30.times do
  Artwork.create(
  title: Faker::Books::CultureSeries.book,
  description: 'Lorem ipsum',
  location: locations.sample,
  price: Faker::Commerce.price(range: 90..500, as_string: true),
  category: categories.sample,
  user: user
)
  puts 'New artwork created'
end
