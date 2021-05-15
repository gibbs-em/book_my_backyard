puts 'Creating fake gardens & reviews...'
if Rails.env.development?
  Garden.destroy_all
  Booking.destroy_all
  Review.destroy_all
end

["10 Downing Street", "221B Baker Street", "48 Doughty Street", "25 Brook Street", "186 Fleet Street", "71 Salford Road", "59A Fairlight Road"].each do |address|
  garden = Garden.new(
    title:    "#{Faker::Compass.direction.capitalize}-facing garden with #{Faker::House.furniture}",
    description: "#{Faker::Movies::HarryPotter.quote}",
    address: "#{address}, London",
    user_id: 1)
  garden.save!
  puts "#{garden.title} created!"
  booking = Booking.new(garden_id: garden.id, user_id: 1)
  booking.save!
  puts "Booking id:#{booking.id} created!"
  review = Review.new(title: 'Great Place!', description: 'I would stay here again', rating: 4, booking_id: booking.id )
  review.save!
  puts "#{review.title} created!"
end

puts 'Finished!'
