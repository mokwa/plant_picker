# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Plant.destroy_all
User.destroy_all
Type.destroy_all

puts "creating seeds"

ronaldo = User.create!(first_name: "Ronaldo", last_name: "Goncalves", email: "ronaldo@example.com", password: "123456", address: "SE15 6UJ", city: "london", nickname: "naldo")

tina = User.create!(first_name: "Tina", last_name: "Iuso", email: "tina@example.com", password: "123456", address: "TW2 6NU", city: "london", nickname: "tina")

juliana = User.create!(first_name: "Juliana", last_name: "Mokwa", email: "juliana@example.com", password: "123456", address: "W14 9HP", city: "london", nickname: "jules")

types1 = ["Flower", "Trees", "Bulbs", "Cactus", "Succulents", "Climbers", "Conifers", "Ferns", "Herbs", "Roses", "Shrubs", "Bamboos", "Palms", "Others" ]
types1.each do |type|
  Type.create!(name: type)
end

type = Type.take

Plant.create!(name: "Orchid", description: "nice flower", status: "available", user: ronaldo, type: type)
Plant.create!(name: "Rose", description: "nice roses", status: "available", user: ronaldo, type: type)

Plant.create!(name: "sunflower", description: "nice yellow flower", status: "available", user: tina, type: type)
Plant.create!(name: "Ivy", description: "nice ivy plant", status: "available", user: tina, type: type)

Plant.create!(name: "Tulip", description: "nice tulip flower", status: "available", user: juliana, type: type)
Plant.create!(name: "Lily", description: "nice lily flower", status: "available", user: juliana, type: type)

puts "seeds done!"