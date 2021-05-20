require 'rails_helper'

RSpec.describe 'the edit candy form', type: :feature do
  before(:each) do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
    @candy_1 = @shop_1.candies.create!(brand: 'Honey Stick', all_natural: true, calories: 65)
    @candy_2 = @shop_1.candies.create!(brand: 'Jelly Belly', all_natural: false, calories: 120)
  end

  it 'has form to edit candy' do
      visit "/candies/#{@candy_1.id}/edit"
    expect(page).to have_content('Update Candy')
    expect(find('form')).to have_content('Brand')
    expect(find('form')).to have_content('All natural')
    expect(find('form')).to have_content('Calories')
    expect(page).to have_button("Submit Candy Update")
    page.find("input[value='#{@candy_1.brand}']")
    page.find("input[value='#{@candy_1.calories}']")
  end

  it 'edits the candy' do
      visit "/candies/#{@candy_1.id}"
    expect(page).to have_content(@candy_1.brand)
    expect(page).to have_button("Update #{@candy_1.brand}")
      click_button "Update #{@candy_1.brand}"
    expect(current_path).to eq("/candies/#{@candy_1.id}/edit")
    fill_in "Brand", with: "Test candy brand"
    select "true", from: "All natural"
    fill_in "Calories", with: 42
      click_button "Submit Candy Update"
      expect(current_path).to eq("/candies/#{@candy_1.id}")
    expect(page).to have_content("Test candy brand")
  end

  describe 'sad path' do
    it 'does not allow creating an incomplete candy edit' do
      visit "/candies/#{@candy_1.id}/edit"

      fill_in "Brand", with: nil
        click_button "Submit Candy Update"
      expect(current_path).to eq("/candies/#{@candy_1.id}")
      expect(page).to have_content("Error: Required information missing")
    end
  end
end
