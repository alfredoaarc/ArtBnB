require 'faker'
require "open-uri"

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
photos_urls = [
  'https://res.cloudinary.com/novapixels/image/upload/v1637062972/ArtBnB/abhishek-upadhyay-VdEB-a__Y9A-unsplash_tusfzw.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062972/ArtBnB/marianna-smiley-jHOg6v6RIIs-unsplash_bgfh6i.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062964/ArtBnB/levi-meir-clancy-jZaQOzrC3XU-unsplash_w36osp.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062964/ArtBnB/michele-caliani-iLAAT1E-H_8-unsplash_oiiyic.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062963/ArtBnB/keeyahtay-lewis-LZNIwgCZdhw-unsplash_b6topk.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062963/ArtBnB/pop-zebra-SMOqwuPLnpQ-unsplash_vvonz8.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062962/ArtBnB/mahdis-mousavi-Oj3BAOj5pTk-unsplash_qtlrwu.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062963/ArtBnB/fabio-oyXis2kALVg-unsplash_axrloa.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062962/ArtBnB/ian-dooley-hpTH5b6mo2s-unsplash_tkkj71.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062962/ArtBnB/pawel-czerwinski-9lNoGFaNI2c-unsplash_hgnuxs.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062962/ArtBnB/fuu-j-g0GyY9aLBdY-unsplash_knqnam.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062963/ArtBnB/jonas-denil-IWwin5RW66Y-unsplash_eku8cq.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062971/ArtBnB/ricardo-gomez-angel-BrSFpu4CDdY-unsplash_xlcb1s.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062969/ArtBnB/peter-olexa-Ejgx4k3iryg-unsplash_cx65b0.jpg',
  'https://res.cloudinary.com/novapixels/image/upload/v1637062970/ArtBnB/pietro-de-grandi-T7K4aEPoGGk-unsplash_wvshev.jpg'
]

puts 'Seeding 30 new artworks'
photos_urls.each do |photo|

  artwork = Artwork.create(
  title: Faker::Books::CultureSeries.book,
  description: 'Lorem ipsum',
  location: locations.sample,
  price: Faker::Commerce.price(range: 90..500, as_string: true),
  category: categories.sample,
  user: user
)
  file = URI.open(photo)
  artwork.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  puts 'New artwork created'
end
