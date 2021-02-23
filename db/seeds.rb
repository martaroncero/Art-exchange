# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?

  puts "creating seeds"

  # only owns a painting and rents it out
  user_owner = User.create!(email: "owner@test.com", password: "123456")

  # only leases a painting
  user_rentee = User.create!(email: "rentee@test.com", password: "123456")

  # owns a painting and leases out another
  user_both = User.create!(email: "both@test.com", password: "123456")

  # user_owner = User.find_by(email: "owner@test.com")
  # user_rentee = User.find_by(email: "rentee@test.com")
  # user_both =  User.find_by(email: "both@test.com")

  oil_painting = Painting.create!(title: "My fancy art", category: "Oil", price_cents_per_day: 2000, width: 100, height: 70, location: "Somewhere in London", user: user_owner)
  acrylic_painting = Painting.create!(title: "Abstract art", category: "Acrylic", price_cents_per_day: 500, width: 40, height: 50, location: "Center in London", user: user_both)

  # User getting the painting: user_rentee (2). Owner of painting: user_both (3)
  Booking.create!(start_date: Date.today, end_date: Date.today + 10, user_id: user_rentee.id, painting_id: acrylic_painting.id)
  # User getting the painting: user_both (3). Owner of painting: user_owner (1)
  Booking.create!(start_date: Date.today + 2, end_date: Date.today + 12, user_id: user_both.id, painting_id: oil_painting.id)

  puts "Seeds created:"
  puts "- 3 new Users"
  puts "- 2 new Paintings"
  puts "- 2 new Bookings"
end