# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#

puts "Cleaning up database..."
Order.destroy_all
Product.destroy_all
User.destroy_all

# puts "Database cleaned"

# puts "Rodando........."
# user1 = User.create!(first_name: "Caio", last_name: "Rocha", email: "caio@teste.com", password: 123123, balance: 100)
# user1.products.create(name: "PS2", price: 4300.50, description: "Ps2 preto em excelente estado", quantity: 2, category: "Game")

# user2 = User.create!(first_name: "Debora", last_name: "lee", email: "debora@teste.com", password: 123123, balance: 100)
# user2.products.create(name: "PS4", price: 50, description: "Ps4 branco em excelente estado", quantity: 5, category: "Console")

# user3 = User.create!(first_name: "Anthony", last_name: "vieira", email: "thony@teste.com", password: 123123, balance: 100)
# user3.products.create(name: "PS5", price: 10.50, description: "Ps5 branco em excelente estado", quantity: 10, category: "Console")

# user4 = User.create!(first_name: "Pedrão", last_name: "Nascimento", email: "pedro@teste.com", password: 123123, balance: 100)
# user4.products.create(name: "PS1", price: 50.50, description: "Ps1 branco em excelente estado", quantity: 1, category: "Service")
# puts "Concluido"
