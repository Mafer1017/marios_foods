Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Games::Pokemon.name,
                  cost: Faker::Number.number(digits: 2),
                  country: Faker::WorldCup.team)
  end

p "Created #{Product.count} products with #{Review.count} reviews"