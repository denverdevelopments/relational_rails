require 'rails_helper'

RSpec.describe 'the bakery and its pastries' do
  before :each do
    @bakery_1 = Bakery.create!(name: "Black Dalia Flour Bakery", open_on_weekends: false, hours_open: 8)
    @pastry_1 = @bakery_1.pastries.create!(name: "I'd kill for those buns", savory_pastry: true, calories: 355)

    @bakery_2 = Bakery.create!(name: "The Hawk Spot Bakery", open_on_weekends: true, hours_open: 6)
    @pastry_2 = @bakery_2.pastries.create!(name: "Paw Print Cookies", savory_pastry: false, calories: 278)
    @pastry_3 = @bakery_2.pastries.create!(name: "Resting Dogs hotdog buns", savory_pastry:true, calories: 200)

    @bakery_3 = Bakery.create!(name: "Rollin' in the Dough Bakery", open_on_weekends: true, hours_open: 6)
    @pastry_4 = @bakery_3.pastries.create!(name: "Gold Coin mini cookies", savory_pastry: false, calories: 100)
    @pastry_5 = @bakery_3.pastries.create!(name: "Rollin in the Cardamom rolls", savory_pastry: false, calories: 600)
  end

  context 'index links' do
    it 'has a link to the pastries index' do
      visit "/bakeries/#{@bakery_1.id}/pastries"

      expect(page).to have_content("Delicious Pastries")

      click_link 'Delicious Pastries'

      expect(current_path).to eq('/pastries')

      visit "/bakeries/#{@bakery_2.id}/pastries"

      expect(page).to have_content("Delicious Pastries")

      click_link 'Delicious Pastries'

      expect(current_path).to eq('/pastries')
    end

    it 'has a link to the bakeries index' do
      visit "/bakeries/#{@bakery_1.id}/pastries"

      expect(page).to have_content("Radical Bakeries")

      click_link 'Radical Bakeries'

      expect(current_path).to eq('/bakeries')

      visit "/bakeries/#{@bakery_2.id}/pastries"

      expect(page).to have_content("Radical Bakeries")

      click_link 'Radical Bakeries'

      expect(current_path).to eq('/bakeries')
    end
  end

  context 'bakery name and their pastries' do
    it 'can show the pastries and their attributes associated with bakery' do
      visit "/bakeries/#{@bakery_1.id}/pastries"

      expect(page).to have_content(@bakery_1.name)
      expect(page).to have_content(@pastry_1.name)
      expect(page).to have_content(@pastry_1.savory_pastry?)
      expect(page).to have_content(@pastry_1.calories)
      expect(page).to_not have_content(@pastry_2.name)
    end
  end

  context 'new pastry link' do
    it 'has a link to create a new pastry' do
      visit "/bakeries/#{@bakery_2.id}/pastries"

      expect(page).to have_link("New Pastry")

      click_link 'New Pastry'

      expect(current_path).to eq("/bakeries/#{@bakery_2.id}/pastries/new")
    end
  end

  context 'optional alphabetical order' do
    it 'has a link to list pastries in alphabetical order' do
      visit "/bakeries/#{@bakery_2.id}/pastries"

      expect(page).to have_link("Alphabetical Order")

      click_link 'Alphabetical Order'

      expect(current_path).to eq("/bakeries/#{@bakery_2.id}/pastries/alpha")
    end
  end

  context 'update each pastry' do
    it 'has a link to update each pastry' do
      visit "/bakeries/#{@bakery_2.id}/pastries"

      within("#pastry-#{@pastry_2.id}") do
        expect(page).to have_link("Update #{@pastry_2.name}")

        first(:link, "Update #{@pastry_2.name}").click

        expect(current_path).to eq("/pastries/#{@pastry_2.id}/edit")
      end
    end
  end
end
