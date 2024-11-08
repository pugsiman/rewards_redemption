# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Reward.create!(name: 'Doll', cost: 500, available: true, inventory_amount: 10)
Reward.create!(name: 'T-shirt', cost: 1000, available: true, inventory_amount: 5)
Reward.create!(name: 'Water gun', cost: 2000, available: true, inventory_amount: 2)
Reward.create!(name: 'Magazine', cost: 500, available: false, inventory_amount: 5)

User.create!(name: 'Aviv', email: 'email@domain.com', credits_amount: 5000)
