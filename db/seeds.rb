# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Category.destroy_all
Category.create(name: "Furniture")
Category.create(name: "Appliance")
Category.create(name: "Kitchen & Dining")
Category.create(name: "Home Decor")
Category.create(name: "Others")

user = User.create(email: 'admin@test.com', password: 'admin123')
user.add_role :admin

User.create(email: 'foo@test.com', password: 'foo123')