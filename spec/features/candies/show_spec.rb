require 'rails_helper'

RSpec.describe 'the candy show page', type: :feature do
  before(:each) do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
    @candy_1 = @shop_1.candies.create!(brand: 'Honey Stick', all_natural: true, calories: 65)
    @candy_2 = @shop_1.candies.create!(brand: 'Jelly Belly', all_natural: false, calories: 120)
  end

  it 'has a link to bakeries index' do
      visit "/candies/#{@candy_1.id}"
    expect(page).to have_link("Bakeries Index")
    click_link("Bakeries Index")
    expect(current_path).to eq("/bakeries")
  end

  it 'has a link to pastries index' do
      visit "/candies/#{@candy_1.id}"
    expect(page).to have_link("Pastries Index")
    click_link("Pastries Index")
    expect(current_path).to eq("/pastries")
  end

  it 'has a link to shops index' do
      visit "/candies/#{@candy_1.id}"
    expect(page).to have_link("Candy Shops Index")
    click_link("Candy Shops Index")
    expect(current_path).to eq("/shops")
  end

  it 'has a link to candies index' do
      visit "/candies/#{@candy_1.id}"
    expect(page).to have_link("Candies Index")
    click_link("Candies Index")
    expect(current_path).to eq("/candies")
  end

  it 'shows the candy attributes' do
      visit "/candies/#{@candy_1.id}"

    expect(page).to have_content(@candy_1.brand)
    expect(page).to have_content("All natural?: #{@candy_1.all_natural}")
    expect(page).to have_content("How many calories?: #{@candy_1.calories}")
    expect(page).to_not have_content(@candy_2.brand)

    # expect(page).to have_link("Edit Discount")
    #   click_link "Edit Discount"
    # expect(current_path).to eq("/merchants/#{merchant_1.id}/discounts/#{discount_1.id}/edit")
  end
end
