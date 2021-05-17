puts "Detroying all Users, gardens, bookings & reviews..."
puts "Destroying all Gardens...."
Garden.destroy_all
puts "Destroying all Bookings...."
Booking.destroy_all
puts "Destroying all Reviews...."
Review.destroy_all
puts "Destroying all Users...."
User.destroy_all

puts "Creating Users, gardens, bookings & reviews..."
puts "--"
puts "Creating Emily & her gardens"
emily = User.new(
  name: "Emily",
  email: "emily@me.org",
  password: "password"
)
emily.save!
puts "User created: #{emily.name}"

garden1 = Garden.new(
  title:    "Boris's Garden",
  description: "10 Downing Street is the official residence and the office of the British Prime Minister. The office helps the Prime Minister to establish... and we do a sweet 🦐 on the barbie!",
  address: "10 Downing Street, London",
  user_id: emily.id,
  toilet: [true, false].sample,
  rain_shelter: [true, false].sample,
  bbq: [true, false].sample,
  peaceful: [true, false].sample,
  heater: [true, false].sample
)
garden1.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/10_Downing_Street.jpg')), filename: '10_Downing_Street.jpg')
garden1.save!
puts "Garden created: #{garden1.title}"

garden2 = Garden.new(
  title:    "Team Gifted's 👋 ",
  description: "Check out Team Gifted's Backyard at Le Wagon. This venue has an active social calendar, supported by it's unique ecosystem and network of graduates.",
  address: "138 Kingsland Rd, London",
  user_id: emily.id,
  toilet: true,
  rain_shelter: true,
  bbq: true,
  peaceful: false,
  heater: true
)
garden2.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/Team_Gifted.jpg')), filename: 'Team_Gifted.jpg')
garden2.save!
puts "Garden created: #{garden2.title}"

puts "--"
puts "Creating Cindy & her gardens"
cindy = User.new(
  name: "Cindy",
  email: "cindy@me.org",
  password: "password"
)
cindy.save!
puts "User created: #{cindy.name}"

garden3 = Garden.new(
  title:    "Sherlock's Hideaway",
  description: "Ha! Grass isn't a garden! It's an affront to the natural flora! Show me a garden of of native trees flowers I'll show you a place where nature thrives!",
  address: "221B Baker Street, London",
  user_id: cindy.id,
  toilet: [true, false].sample,
  rain_shelter: [true, false].sample,
  bbq: [true, false].sample,
  peaceful: [true, false].sample,
  heater: [true, false].sample
)
garden3.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/garden3.jpg')), filename: 'garden3.jpg')
garden3.save!
puts "Garden created: #{garden3.title}"

garden4 = Garden.new(
  title:    "Charlie D's Garden",
  description: "Welcome to the Charles Dickens Garden -  In this garden we guard the den of nature, for here we bare our souls in such nurturing safety.",
  address: "48 Doughty Street, London",
  user_id: cindy.id,
  toilet: [true, false].sample,
  rain_shelter: [true, false].sample,
  bbq: [true, false].sample,
  peaceful: [true, false].sample,
  heater: [true, false].sample
)
garden4.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/garden4.jpg')), filename: 'garden4.jpg')
garden4.save!
puts "Garden created: #{garden4.title}"

puts "--"
puts "Creating Daniella & her gardens"
dani = User.new(
  name: "Daniella",
  email: "daniella@me.org",
  password: "password"
)
dani.save!
puts "User created: #{dani.name}"

garden5 = Garden.new(
  title:    "Handel House Garden",
  description: "If the insects and birds aren't thriving there maximally, it is no garden but a green desert. On 24 February 1958 25 Brook Street was granted a Grade I listing by the Department of the Environment.",
  address: "25 Brook Street, London",
  user_id: dani.id,
  toilet: [true, false].sample,
  rain_shelter: [true, false].sample,
  bbq: [true, false].sample,
  peaceful: [true, false].sample,
  heater: [true, false].sample
)
garden5.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/garden5.jpg')), filename: 'garden5.jpg')
garden5.save!
puts "Garden created: #{garden5.title}"

garden6 = Garden.new(
  title:    "S.Todd's Peaceful Garden",
  description: "A peacefule garden, be sure to check out Mrs. Lovett's pie shop in nearby Bell Yard.",
  address: "186 Fleet Street, London",
  user_id: dani.id,
  toilet: [true, false].sample,
  rain_shelter: [true, false].sample,
  bbq: [true, false].sample,
  peaceful: [true, false].sample,
  heater: [true, false].sample
)
garden6.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/garden6.jpg')), filename: 'garden6.jpg')
garden6.save!
puts "Garden created: #{garden6.title}"

puts "--"
puts "Creating Thomas & his gardens"
thomas = User.new(
  name: "Thomas",
  email: "thomas@me.org",
  password: "password"
)
thomas.save!
puts "User created: #{thomas.name}"

garden7 = Garden.new(
  title:    "Buckingham Palace Garden",
  description: "My backyard is a sanctuary for nature and in that it becomes my own place of serenity.",
  address: "Buckingham Palace Garden, London",
  user_id: thomas.id,
  toilet: [true, false].sample,
  rain_shelter: [true, false].sample,
  bbq: [true, false].sample,
  peaceful: [true, false].sample,
  heater: [true, false].sample
)
garden7.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/garden7.jpg')), filename: 'garden7.jpg')
garden7.save!
puts "Garden created: #{garden7.title}"

garden8 = Garden.new(
  title:    "Sky Garden",
  description: "The garden gave us sanctuary and so we made sure to plant the kind of flora that did the same for mother nature.",
  address: "20 Fenchurch Street, London",
  user_id: thomas.id,
  toilet: [true, false].sample,
  rain_shelter: [true, false].sample,
  bbq: [true, false].sample,
  peaceful: [true, false].sample,
  heater: [true, false].sample
)
garden8.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/seed/garden8.jpg')), filename: 'garden8.jpg')
garden8.save!
puts "Garden created: #{garden8.title}"

puts "--"
puts "Creating Bookings"

booking1 = Booking.new(
  user_id: cindy.id,
  garden_id: garden2.id,
  date: Date.parse('2021-05-15')
)
booking1.save!
puts "Booking created: ID:#{booking1.id} on #{booking1.date}"

booking2= Booking.new(
  user_id: dani.id,
  garden_id: garden2.id,
  date: Date.parse('2021-05-16')
)
booking2.save!
puts "Booking created: ID:#{booking2.id} on #{booking2.date}"

booking3 = Booking.new(
  user_id: thomas.id,
  garden_id: garden2.id,
  date: Date.parse('2021-05-17')
)
booking3.save!
puts "Booking created: ID:#{booking3.id} on #{booking3.date}"

puts "--"
puts "Creating Reviews"

review1 = Review.new(
  title: "Love it!",
  description: "Lovely vibe and just what was required after so long in lockdown.",
  rating: 5,
  booking_id: booking1.id
)
review1.save!
puts "Review created: #{review1.title}"

review2= Review.new(
  title: "So much fun",
  description: "Venue is kitted out superbly - thank you!!! Can't beleive how easy this service was to book!",
  rating: 4,
  booking_id: booking2.id
)
review2.save!
puts "Review created: #{review2.title}"

review3 = Review.new(
  title: "Sorry about the toilet",
  description: "Amazing venue & facilities. Thank you. (sorry about the state we left the toilet in)",
  rating: 5,
  booking_id: booking3.id
)
review3.save!
puts "Review created: #{review3.title}"

review4 = Review.new(
  title: "Always a great venue. Will be back",
  description: "I only give 4 stars, because it was raining.",
  rating: 4,
  booking_id: booking1.id
)
review4.save!
puts "Review created: #{review4.title}"

puts "--"
puts "
*****************
All bookings and reviews are under the Team Gifted Garden.

Login details are as follows:
email: #{emily.email}
email: #{cindy.email}
email: #{dani.email}
email: #{thomas.email}
password: password
*****************
"

puts "--"
puts 'Finished!'
