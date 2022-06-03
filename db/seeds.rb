require 'faker'

Product.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Games::Pokemon.name,
                            cost: Faker::Number.number(digits: 2),
                            country: Faker::WorldCup.team)
  product.save()
  5.times do |i|
    product.reviews.create!(author: Faker::Games::SuperMario.character,
                          content_body: Faker::Lorem.sentence(word_count: 25),
                          rating: Faker::Number.within(range: 1..5))
  end
end


p "Created #{Product.count} products with #{Review.count} reviews"