require 'rails_helper'

RSpec.describe 'the pastry edit page', type: :feature do
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

  context 'index page link' do
    it 'has a link to the bakery index page' do
      visit "/pastries/#{@pastry_1.id}/edit"

      expect(page).to have_link('Radical Bakeries')

      click_link 'Radical Bakeries'

      expect(current_path).to eq('/bakeries')
    end

    it 'has a link to the pastry index page' do
      visit "/pastries/#{@pastry_1.id}/edit"

      expect(page).to have_link('Delicious Pastries')

      click_link 'Delicious Pastries'

      expect(current_path).to eq('/pastries')
    end
  end
end
