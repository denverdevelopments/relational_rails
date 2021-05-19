require 'rails_helper'

RSpec.describe 'the pastry show page', type: :feature do
  before :each do
    @bakery_1 = Bakery.create!(name: "The Hawk Spot Bakery", open_on_weekends: true, hours_open: 6)
    @pastry_1 = @bakery_1.pastries.create!(name: "Paw Print Cookies", savory_pastry: false, calories: 278)
    @pastry_2 = @bakery_1.pastries.create!(name: "Resting Dogs hotdog buns", savory_pastry:true, calories: 200)
  end

  context 'index links' do
    it 'has a link to the pastires index' do
      visit "/pastries/#{@pastry_1.id}"

      expect(page).to have_content("Delicious Pastries")

      click_link 'Delicious Pastries'

      expect(current_path).to eq('/pastries')
    end

    it 'has a link to the bakeries index' do
      visit "/pastries/#{@pastry_1.id}"

      expect(page).to have_content("Radical Bakeries")

      click_link 'Radical Bakeries'

      expect(current_path).to eq('/bakeries')
    end
  end

  context 'pastry details' do
    it 'shows the pastry name' do
      visit "/pastries/#{@pastry_1.id}"

      expect(page).to have_content(@pastry_1.name)
    end

    it 'show the attributes of the pastry' do
      visit "/pastries/#{@pastry_1.id}"

      expect(page).to have_content("Is this a Savory Pastry?")
      expect(page).to have_content(@pastry_1.savory_pastry)
      expect(page).to have_content("Calorie Amount:")
      expect(page).to have_content(@pastry_1.calories)
    end

    it 'does not show any other pastry' do
      visit "/pastries/#{@pastry_1.id}"

      expect(page).to_not have_content(@pastry_2.name)
    end
  end

  context 'update pastry' do
    it 'has a link to update a pastry' do
      visit "/pastries/#{@pastry_1.id}"

      expect(page).to have_content('Update Pastry')

      click_link 'Update Pastry'

      expect(current_path).to eq("/pastries/#{@pastry_1.id}/edit")
    end
  end
end
