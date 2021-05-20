require 'rails_helper'

RSpec.describe 'the candy show page', type: :feature do
  before(:each) do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
    @candy_1 = @shop_1.candies.create!(brand: 'Honey Stick', all_natural: true, calories: 65)
    @candy_2 = @shop_1.candies.create!(brand: 'Jelly Belly', all_natural: false, calories: 120)
  end

  it 'has a link to all four main indexes' do
      visit "/candies/#{@candy_1.id}"
    expect(page).to have_link("Bakeries Index")
      click_link("Bakeries Index")
    expect(current_path).to eq("/bakeries")

      visit "/candies/#{@candy_1.id}"
    expect(page).to have_link("Pastries Index")
      click_link("Pastries Index")
    expect(current_path).to eq("/pastries")

      visit "/candies/#{@candy_1.id}"
    expect(page).to have_link("Candy Shops Index")
      click_link("Candy Shops Index")
    expect(current_path).to eq("/shops")

      visit "/candies/#{@candy_1.id}"
    expect(page).to have_link("Candies Index")
      click_link("Candies Index")
    expect(current_path).to eq("/candies")
  end

  it 'shows the candy attributes' do
      visit "/candies/#{@candy_1.id}"

    expect(page).to have_content(@candy_1.brand)
    expect(page).to have_content("Candy ID#: #{@candy_1.id}")
    expect(page).to have_content("All natural?: #{@candy_1.all_natural}")
    expect(page).to have_content("#{@candy_1.calories} calories")
    expect(page).to_not have_content(@candy_2.brand)
  end

  it 'has a button to Update the candy' do
      visit "/candies/#{@candy_1.id}"
    expect(page).to have_button("Update #{@candy_1.brand}")
      click_button("Update #{@candy_1.brand}")
    expect(current_path).to eq("/candies/#{@candy_1.id}/edit")
  end

  it 'has a button to Delete the candy' do
      visit "/candies/#{@candy_1.id}"
    expect(page).to have_button("( Delete #{@candy_1.brand} )")
      click_button("( Delete #{@candy_1.brand} )")
    expect(current_path).to eq("/candies")
    expect(page).to_not have_content(@candy_1.brand)
  end
end
