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

@dalia_flour = Bakery.create!(name: "Black Dalia Flour Bakery", open_on_weekends: false, hours_open: 8)
@killer_bun = @dalia_flour.pastries.create!(name: "I'd kill for those buns", savory_pastry: true, calories: 355)

@hawk_spot = Bakery.create!(name: "The Hawk Spot Bakery", open_on_weekends: true, hours_open: 6)
@paw_print = @hawk_spot.pastries.create!(name: "Paw Print Cookies", savory_pastry: false, calories: 278)
@resting_dogs = @hawk_spot.pastries.create!(name: "Resting Dogs hotdog buns", savory_pastry:true, calories: 200)

@rollin_dough = Bakery.create!(name: "Rollin' in the Dough Bakery", open_on_weekends: true, hours_open: 6)
@coin_cookies = @rollin_dough.pastries.create!(name: "Gold Coin mini cookies", savory_pastry: false, calories: 100)
@rollin_roll = @rollin_dough.pastries.create!(name: "Rollin in the Cardamom rolls", savory_pastry: false, calories: 600)

##Kevin's Seeds
Shop.destroy_all
Candy.destroy_all

@shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
@candy_1 = @shop_1.candies.create!(brand: 'Honey Stick', all_natural: true, calories: 65)
@candy_2 = @shop_1.candies.create!(brand: 'Jelly Belly', all_natural: false, calories: 120)

@shop_3 = Shop.create!(name: 'Suga Suga', sells_drinks: true, varieties: 205)
@candy_6 = @shop_3.candies.create!(name: 'Pop Rocks', all_natural: true, calories: 85)
@candy_7 = @shop_3.candies.create!(name: 'Milk Duds', all_natural: false, calories: 310)
