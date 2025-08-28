# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 1. Clean the database 🗑️
puts "Cleaning database..."
User.destroy_all
Car.destroy_all

# 2. Create the users instances 🏗️
joao   = User.create!(first_name: "João", last_name: "Cork Oak", email: "corkoak@gmail.com", password: "winecork")
ricardo = User.create!(first_name: "Ricardo", last_name: "Bushes", email: "bushes@gmail.com", password: "winebushes")
laurie = User.create!(first_name: "Laurie", last_name: "Small Rock", email: "smallrock@gmail.com", password: "wineglass")

# 3. Display a message 🎉
puts "Finished! Created #{User.count} users."

# 4. Create the cars instances 🏗️
opel = Car.create!(brand: "Opel", model: "Astra", year: 2000, user: joao)
Chat.create!(title: "untitle", model_id: "gpt-4.1-nano", car: opel)
lamborghini = Car.create!(brand: "Lamborghini", model: "Urus", year: 2025, user: ricardo)
Chat.create!(title: "untitle", model_id: "gpt-4.1-nano", car: lamborghini)
mitsubishi = Car.create!(brand: "Mitsubishi", model: "Colt", year: 2009, user: laurie)
Chat.create!(title: "untitle", model_id: "gpt-4.1-nano", car: mitsubishi)

# 5. Display a message 🎉
puts "Finished! Created #{Car.count} cars."
