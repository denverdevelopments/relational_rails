require 'rails_helper'

RSpec.describe 'the shop show page', type: :feature do
  before(:each) do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
    @shop_2 = Shop.create!(name: 'Gimme Some Suga', sells_drinks: false, varieties: 205)
  end

  it 'has a link to bakeries index' do
      visit "/shops/#{@shop_1.id}"
    expect(page).to have_link("Bakeries Index")
    click_link("Bakeries Index")
    expect(current_path).to eq("/bakeries")
  end

  it 'has a link to pastries index' do
      visit "/shops/#{@shop_1.id}"
    expect(page).to have_link("Pastries Index")
    click_link("Pastries Index")
    expect(current_path).to eq("/pastries")
  end

  it 'has a link to shops index' do
      visit "/shops/#{@shop_1.id}"
    expect(page).to have_link("Candy Shops Index")
    click_link("Candy Shops Index")
    expect(current_path).to eq("/shops")
  end

  it 'has a link to candies index' do
      visit "/shops/#{@shop_1.id}"
    expect(page).to have_link("Candies Index")
    click_link("Candies Index")
    expect(current_path).to eq("/candies")
  end

  it 'shows the shop name, attributes' do
      visit "/shops/#{@shop_1.id}"

    expect(page).to have_content(@shop_1.name)
    expect(page).to_not have_content(@shop_2.name)
    expect(page).to have_content("Shop ID#: #{@shop_1.id}")
    expect(page).to have_content("Sell drinks?: #{@shop_1.sells_drinks}")
    expect(page).to have_content("How many candy varieties?: #{@shop_1.varieties}")
    expect(page).to have_content("#{@shop_1.candies.count} candy(s) available")
    expect(page).to have_link("#{@shop_1.candies.count} candy(s) available")
      click_link "#{@shop_1.candies.count} candy(s) available"
    expect(current_path).to eq("/shops/#{@shop_1.id}/candies")
  end

  it 'has a button to update the shop' do
      visit "/shops/#{@shop_1.id}"
    expect(page).to have_button("Update #{@shop_1.name}")
      click_button("Update #{@shop_1.name}")
    expect(current_path).to eq("/shops/#{@shop_1.id}/edit")
  end

  it 'has a button to delete the shop' do
      visit "/shops/#{@shop_1.id}"
    expect(page).to have_button("( Delete #{@shop_1.name} )")
      click_button("( Delete #{@shop_1.name} )")
    expect(current_path).to eq("/shops")
  end
end
