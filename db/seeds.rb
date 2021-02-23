# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# if Rails.env.development?

  puts "creating seeds"

  # # only owns a painting and rents it out
  # user_owner = User.create!(email: "owner@test.com", password: "123456")
  user_owner = User.create!(email: "collector_5000@mail.com", password: "123456")
  user_owner1 = User.create!(email: "alex_523@mail.com", password: "123456")
 

  # # only leases a painting
  # user_rentee = User.create!(email: "rentee@test.com", password: "123456")
  user_rentee = User.create!(email: "jack@mail.com", password: "123456"

  # # owns a painting and leases out another
  # user_both = User.create!(email: "both@test.com", password: "123456")
  user_both = User.create!(email: "thequeen@mail.com", password: "123456")

  # user_owner = User.find_by(email: "owner@test.com")
  # user_rentee = User.find_by(email: "rentee@test.com")
  # user_both =  User.find_by(email: "both@test.com")

  # oil_painting = Painting.create!(title: "My fancy art", category: "Oil", price_cents_per_day: 2000, width: 100, height: 70, location: "Somewhere in London", user: user_owner)
  #  = Painting.create!(title: "Abstract art", category: "Acrylic", price_cents_per_day: 500, width: 40, height: 50, location: "Center in London", user: user_both)
  Painting.create!(title: "The Starry Night- Vincent van Gogh", category: "Acrylic", price_cents_per_day: 20000, width: 100, height: 70, location: "Madrid", user: collector_5000@mail.com)
  Painting.create!(title: "The Kiss-Gustav Klimt", category: "Oil", price_cents_per_day: 30000, width: 100, height: 70, location: "Vienna", user: collector_5000@mail.com)
  Painting.create!(title: "Girl with a Pearl Earring-Johannes Vermeer", category: "Acrylic", price_cents_per_day: 20000, width: 100, height: 70, location: "Madrid", user: jack@mail.com)
  
  Painting.create!(title: "The Scream- Edvard Munch", category: "Oil", price_cents_per_day: 30000, width: 80, height: 100, location: "Oslo", user: jack@mail.com)
  Painting.create!(title: "The Birth of Venus - Sandro Botticelli", category: "Acrylic", price_cents_per_day: 48000, width: 100, height: 83, location: "Florence", user: thequeen@mail.com)
  Painting.create!(title: "Dogs playing poker - C.M. Coolidge", category: "Oil", price_cents_per_day: 48000, width: 100, height: 123, location: "Madrid", user: thequeen@mail.com)

  Painting.create!(title: "Guernica - Pablo Picasso", category: "Oil", price_cents_per_day: 23000, width: 120, height: 50, location: "Madrid", user: alex_523@mail.com)
  Painting.create!(title: "The Starry Night", category: "Oil", price_cents_per_day: 20000, width: 100, height: 70, location: "Madrid", user: alex_523@mail.com)
  Painting.create!(title: "Mona Lisa-Leonardo Da Vinci", category: "Oil", price_cents_per_day: 50000, width: 100, height: 83, location: "Paris", user: alex_523@mail.com)
  Painting.create!(title: "The Last Supper- Leonardo Da Vinci", category: "Acrylic", price_cents_per_day: 650000, width: 190, height: 95, location: "Milan", user: alex_523@mail.com)
  

  # User getting the painting: user_rentee (2). Owner of painting: user_both (3)
  Booking.create!(start_date: Date.today, end_date: Date.today + 10, user_id: user_rentee.id, painting_id: .id)
  # User getting the painting: user_both (3). Owner of painting: user_owner (1)
  Booking.create!(start_date: Date.today + 2, end_date: Date.today + 5, user_id: user_owner.id, painting_id: oil_painting.id)
  Booking.create!(start_date: Date.today + 2, end_date: Date.today + 24, user_id: user_owner1.id, painting_id: oil_painting.id)
  Booking.create!(start_date: Date.today + 2, end_date: Date.today + 12, user_id: user_both.id, painting_id: oil_painting.id)

  puts "Seeds created:"
  puts "- 3 new Users"
  puts "- 2 new Paintings"
  puts "- 2 new Bookings"
end