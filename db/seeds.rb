puts "Cleaning db"
Booking.destroy_all
Painting.destroy_all
User.destroy_all


puts "creating seeds"

user_collector = User.create!(email: "collector_5000@mail.com", password: "123456")
user_alex = User.create!(email: "alex_523@mail.com", password: "123456")
user_jack = User.create!(email: "jack@mail.com", password: "123456")
user_queen = User.create!(email: "thequeen@mail.com", password: "123456")

van_gogh = Painting.create!(title: "The Starry Night - Vincent van Gogh", category: "Acrylic", price_cents_per_day: 20000, width: 100, height: 70, location: "Madrid", user: user_collector)
van_gogh.photo.attach(io: URI.open('https://res.cloudinary.com/ds32iiece/image/upload/v1614180738/9zde5zz9py7rg17okx73ngfznolt.jpg'), filename: "vangogh.jpg", content_type: "image/jpg")

the_kiss = Painting.create!(title: "The Kiss - Gustav Klimt", category: "Oil", price_cents_per_day: 30000, width: 100, height: 70, location: "Vienna", user: user_collector)
the_kiss.photo.attach(io: URI.open('https://res.cloudinary.com/ds32iiece/image/upload/v1614180324/cv7771nxrgybrozdby6818zxppe7.jpg'), filename: "thekiss.jpg", content_type: "image/jpg")

girl = Painting.create!(title: "Girl with a Pearl Earring - Johannes Vermeer", category: "Acrylic", price_cents_per_day: 20000, width: 100, height: 70, location: "Madrid", user: user_jack)
girl.photo.attach(io: URI.open('https://res.cloudinary.com/ds32iiece/image/upload/v1614180564/ws2as0a6qv2ro22copm69xgppsed.jpg'), filename: "girl.jpg", content_type: "image/jpg")

the_scream = Painting.create!(title: "The Scream - Edvard Munch", category: "Oil", price_cents_per_day: 30000, width: 80, height: 100, location: "Oslo", user:user_jack)
the_scream.photo.attach(io: URI.open('https://res.cloudinary.com/ds32iiece/image/upload/v1614171161/pgdqttcovu9qhc2e6h13tp57wjwz.png'), filename: "thescream.jpg", content_type: "image/jpg")

venus = Painting.create!(title: "The Birth of Venus - Sandro Botticelli", category: "Acrylic", price_cents_per_day: 48000, width: 100, height: 83, location: "Florence", user: user_queen)
venus.photo.attach(io: URI.open('https://res.cloudinary.com/ds32iiece/image/upload/v1614180635/y69zvfntpyrhcakok9arhq9byv5z.jpg'), filename: "venus.jpg", content_type: "image/jpg")

dogs = Painting.create!(title: "Dogs playing poker - C.M. Coolidge", category: "Oil", price_cents_per_day: 48000, width: 100, height: 123, location: "Madrid", user: user_queen)
dogs.photo.attach(io: URI.open('https://res.cloudinary.com/ds32iiece/image/upload/v1614180287/5oesh8qb6wtth4690upm2f756hvc.jpg'), filename: "dogs.jpg", content_type: "image/jpg")

guernica = Painting.create!(title: "Guernica - Pablo Picasso", category: "Oil", price_cents_per_day: 23000, width: 120, height: 50, location: "Madrid", user: user_alex)
guernica.photo.attach(io: URI.open('https://res.cloudinary.com/ds32iiece/image/upload/v1614180469/h6ags6oxld30n044a17dhqb6gos8.jpg'), filename: "guernica.jpg", content_type: "image/jpg")

adele = Painting.create!(title: "Potrait of Adele Bloch-Bauer II - Gustav Klimt", category: "Oil", price_cents_per_day: 10000, width: 100, height: 150, location: "Vienna", user: user_alex)
adele.photo.attach(io: URI.open('https://res.cloudinary.com/ds32iiece/image/upload/v1614336776/download_latexe.jpg'), filename: "adele.jpg", content_type: "image/jpg")


mona_lisa = Painting.create!(title: "Mona Lisa - Leonardo Da Vinci", category: "Oil", price_cents_per_day: 50000, width: 100, height: 83, location: "Paris", user: user_alex)
mona_lisa.photo.attach(io: URI.open('https://res.cloudinary.com/ds32iiece/image/upload/v1614180591/avw8izzvf17h582mfn8x4zex3wn5.jpg'), filename: "monalisa.jpg", content_type: "image/jpg")

head = Painting.create!(title: "Head of a Woman - Leonardo Da Vinci", category: "Oil", price_cents_per_day: 50000, width: 100, height: 83, location: "Parma", user: user_collector)
head.photo.attach(io: URI.open('https://res.cloudinary.com/ds32iiece/image/upload/v1614339619/download_1_fpcpy0.jpg'), filename: "monalisa.jpg", content_type: "image/jpg")

last = Painting.create!(title: "The Last Supper- Leonardo Da Vinci", category: "Oil", price_cents_per_day: 650000, width: 190, height: 95, location: "Milan", user: user_queen)
last.photo.attach(io: URI.open('https://res.cloudinary.com/ds32iiece/image/upload/v1614180634/1pkywfiym57hz5nqgcch5kbks7zz.jpg'), filename: "last.jpg", content_type: "image/jpg")

annunciation = Painting.create!(title: "The Annunciation - Leonardo Da Vinci", category: "Oil", price_cents_per_day: 650000, width: 190, height: 95, location: "Florence", user: user_alex)
annunciation.photo.attach(io: URI.open('https://res.cloudinary.com/ds32iiece/image/upload/v1614339720/download_2_lnq2ls.jpg'), filename: "annunciation.jpg", content_type: "image/jpg")


Booking.create!(start_date: Date.today, end_date: Date.today + 10, user_id: user_collector.id, painting_id: the_scream.id)
Booking.create!(start_date: Date.today + 2, end_date: Date.today + 5, user_id: user_collector.id, painting_id: girl.id)
Booking.create!(start_date: Date.today + 1, end_date: Date.today + 24, user_id: user_jack.id, painting_id: venus.id)
Booking.create!(start_date: Date.today + 4, end_date: Date.today + 13, user_id: user_jack.id, painting_id: van_gogh.id)
Booking.create!(start_date: Date.today + 3, end_date: Date.today + 14, user_id: user_queen.id, painting_id: mona_lisa.id)

puts "Seeds created"
puts "- 4 new Users"
puts "- 10 new Paintings"
puts "- 5 new Bookings"
