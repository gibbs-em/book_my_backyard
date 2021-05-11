puts 'Creating 10 fake gardens...'
if Rails.env.development?
  Garden.destroy_all
end
10.times do
  garden = Garden.new(
    title:    "#{Faker::Compass.direction}-facing garden with #{Faker::House.furniture}",
    description: "#{Faker::Movies::HarryPotter.quote}",
    address: "#{Faker::Address.street_address}, London",
    postcode: "#{Faker::Address.postcode}",
    user_id: 1)
  garden.save!
end
puts 'Finished!'
