require 'rails_helper'

RSpec.describe 'the candies index', type: :feature do
  before(:each) do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
    @candy_1 = @shop_1.candies.create!(brand: 'Honey Stick', all_natural: true, calories: 65)
    @candy_2 = @shop_1.candies.create!(brand: 'Jelly Belly', all_natural: false, calories: 120)
  end

  it 'has a link to bakeries index' do
      visit "/candies"
    expect(page).to have_link("Bakeries Index")
    click_link("Bakeries Index")
    expect(current_path).to eq("/bakeries")
  end

  it 'has a link to pastries index' do
      visit "/candies"
    expect(page).to have_link("Pastries Index")
    click_link("Pastries Index")
    expect(current_path).to eq("/pastries")
  end

  it 'has a link to shops index' do
      visit "/candies"
    expect(page).to have_link("Candy Shops Index")
    click_link("Candy Shops Index")
    expect(current_path).to eq("/shops")
  end

  it 'has a link to candies index' do
      visit "/candies"
    expect(page).to have_link("Candies Index")
    click_link("Candies Index")
    expect(current_path).to eq("/candies")
  end

  it 'lists of all candies & attributes' do
    visit "/candies"

    within("#candy-index") do

      within("#candy-#{@candy_1.id}") do
        expect(page).to have_content(@candy_1.brand)
        expect(page).to have_content("All natural")
        expect(page).to have_content(@candy_1.calories)
      end

      within("#candy-#{@candy_2.id}") do
        expect(page).to have_content(@candy_2.brand)
        expect(page).to have_content("Artificial ingredients")
        expect(page).to have_content(@candy_2.calories)
      end
    end
  end     #candy index - us#3

  it 'has links to Update' do
      visit "/candies"
    expect(page).to have_content(@candy_1.brand)
    expect(page).to have_button("Update #{@candy_1.brand}")
      click_button "Update #{@candy_1.brand}"
    expect(current_path).to eq("/candies/#{@candy_1.id}/edit")

      visit "/candies"
    expect(page).to have_content(@candy_2.brand)
    expect(page).to have_button("Update #{@candy_2.brand}")
      click_button "Update #{@candy_2.brand}"
    expect(current_path).to eq("/candies/#{@candy_2.id}/edit")
  end     #candy edit link - us#17

  it 'has links to delete' do
    visit "/candies"

    within("#candy-#{@candy_1.id}") do
      expect(page).to have_content(@candy_1.brand)
      expect(page).to have_button("( Delete )")
        click_button "( Delete )"
    end
    
    expect(page).to_not have_content(@candy_1.brand)
  end     #candy delete link - us#20

end
