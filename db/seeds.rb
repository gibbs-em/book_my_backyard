puts 'Creating 10 fake gardens...'
if Rails.env.development?
  Garden.destroy_all
end

["10 Downing Street", "221B Baker Street", "48 Doughty Street", "25 Brook Street", "186 Fleet Street", "71 Salford Road", "59A Fairlight Road"].each do |address|
  garden = Garden.new(
    title:    "#{Faker::Compass.direction.capitalize}-facing garden with #{Faker::House.furniture}",
    description: "#{Faker::Movies::HarryPotter.quote}",
    address: "#{address}, London",
    user_id: 1)
  garden.save!
end
puts 'Finished!'
