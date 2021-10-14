
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
images = Dir.new(Rails.root.to_s + "/app/assets/images/seed_images").select {|i| i.include? "jpg" }
index = -1
10.times do
  index += 1
  Recipe.create(title: Faker::Food.dish, author: Faker::Name.name, description: Faker::Food.description, image_url: "seed_images/#{images[index]}")
end
