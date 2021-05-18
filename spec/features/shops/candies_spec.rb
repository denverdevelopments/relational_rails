require 'rails_helper'

RSpec.describe 'the shop candies index', type: :feature do
  before(:each) do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
    @candy_1 = @shop_1.candies.create!(brand: 'Honey Stick', all_natural: true, calories: 65)
    @candy_2 = @shop_1.candies.create!(brand: 'Jelly Belly', all_natural: false, calories: 120)

    @shop_2 = Shop.create!(name: 'Gimme Some Suga', sells_drinks: false, varieties: 205)
    @candy_3 = @shop_1.candies.create!(brand: 'Lollipops', all_natural: true, calories: 48)
  end

  it 'has a link to bakeries index' do
      visit "/shops/#{@shop_1.id}/candies"
    expect(page).to have_link("Bakeries Index")
    click_link("Bakeries Index")
    expect(current_path).to eq("/bakeries")
  end

  it 'has a link to pastries index' do
      visit "/shops/#{@shop_1.id}/candies"
    expect(page).to have_link("Pastries Index")
    click_link("Pastries Index")
    expect(current_path).to eq("/pastries")
  end

  it 'has a link to shops index' do
      visit "/shops/#{@shop_1.id}/candies"
    expect(page).to have_link("Candy Shops Index")
    click_link("Candy Shops Index")
    expect(current_path).to eq("/shops")
  end

  it 'has a link to candies index' do
      visit "/shops/#{@shop_1.id}/candies"
    expect(page).to have_link("Candies Index")
    click_link("Candies Index")
    expect(current_path).to eq("/candies")
  end

  it 'lists of all shop candies names' do
    visit "/shops/#{@shop_1.id}/candies"

    within("#candies-index") do

      within("#candies-#{@candy_1.id}") do
        expect(page).to have_content(@candy_1.brand)
        expect(page).to have_link("Edit #{@candy_1.brand}")
      end

      within("#candies-#{@candy_2.id}") do
        expect(page).to have_content(@candy_2.brand)
        expect(page).to have_link("Edit #{@candy_2.brand}")

      end

      # expect(page).to_not have_content(@candy_3.brand)
    end
  end     #Parent Children Index - us#5

end
