# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Leigh's Seeds
Bakery.destroy_all
Pastry.destroy_all

@dalia_flour = Bakery.create!(name: "Dalia Flour Bakery", open_on_weekends: false, hours_open: 8)
@hawk_spot = Bakery.create!(name: "The Hawk Spot Bakery", open_on_weekends: true, hours_open: 6)

# Kevin's Seeds
