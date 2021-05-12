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








##Kevin's Seeds
@shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
@candy_1 = @shop_1.candies.create!(name: 'Honey Stick', all_natural: true, calories: 65)
@candy_2 = @shop_1.candies.create!(name: 'Jelly Belly', all_natural: false, calories: 120)

@shop_2 = Shop.create!(name: 'Candy Corral', sells_drinks: false, varieties: 45)
@candy_3 = @shop_2.candies.create!(name: 'Lollipops', all_natural: true, calories: 48)
@candy_4 = @shop_2.candies.create!(name: 'Hershey Bar', all_natural: false, calories: 230)
@candy_5 = @shop_2.candies.create!(name: 'Jolly Rancher', all_natural: false, calories: 40)

@shop_3 = Shop.create!(name: 'Suga Suga', sells_drinks: true, varieties: 205)
@candy_6 = @shop_3.candies.create!(name: 'Pop Rocks', all_natural: true, calories: 85)
@candy_7 = @shop_3.candies.create!(name: 'Milk Duds', all_natural: false, calories: 310)

