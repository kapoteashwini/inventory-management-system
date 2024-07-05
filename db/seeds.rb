# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
admin = User.create(email: 'admin@example.com', password: 'password', role: :admin)
manager = User.create(email: 'manager@example.com', password: 'password', role: :manager)
employee = User.create(email: 'employee@example.com', password: 'password', role: :employee)

InventoryItem.create(name: 'Item 1', description: 'Description for item 1', quantity: 10, price: 100.0)
InventoryItem.create(name: 'Item 2', description: 'Description for item 2', quantity: 5, price: 50.0)
