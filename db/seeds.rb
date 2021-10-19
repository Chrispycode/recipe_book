
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
images = Dir.new(Rails.root.join('app/assets/images/seed_images')).select {|i| i.include? 'webp' }

def ingredients
  ingrds = []
  6.times do
    ingrds << {
      name:   Faker::Food.ingredient,
      amount: Faker::Number.decimal(l_digits: 2, r_digits: 1),
      unit:   Ingredient::UNITS.sample
    }
  end
  ingrds
end

10.times do
  images.each do |image|
    Recipe.new(
      title:       Faker::Food.dish,
      author:      Faker::Name.name,
      description: Faker::Food.description,
      image_url:   "seed_images/#{image}",
      ingredients_attributes: ingredients
    ).save(validate: false)
  end
end
