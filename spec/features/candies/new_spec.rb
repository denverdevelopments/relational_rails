require 'rails_helper'

RSpec.describe 'the create new candy form', type: :feature do
  before(:each) do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
  end

  it 'has form to create new candy' do
      visit "/shops/#{@shop_1.id}/candies/new"
    expect(page).to have_content('New Candy')
    expect(find('form')).to have_content('Brand')
    expect(find('form')).to have_content('All natural')
    expect(find('form')).to have_content('Calories')
    expect(page).to have_button("Create New Candy")
      click_on "Create New Candy"
  end

  it "creates a new shop candy" do
      visit "/shops/#{@shop_1.id}/candies"
    expect(page).to have_link("Add New Candy")
      click_link "Add New Candy"
    expect(current_path).to eq("/shops/#{@shop_1.id}/candies/new")
    fill_in "Brand", with: "Test candy"
    select "true", from: "All natural"
    fill_in "Calories", with: 42
      click_button "Create New Candy"
    expect(current_path).to eq("/shops/#{@shop_1.id}/candies")
    expect(page).to have_content("Test candy")
  end

  describe 'sad path' do
    it 'does not allow creating an incomplete candy' do
      visit "/shops/#{@shop_1.id}/candies/new"

      fill_in "Brand", with: "Failed candy"
        click_button "Create New Candy"
      expect(current_path).to eq("/shops/#{@shop_1.id}/candies")
      expect(page).to have_content("Candy not created: Required information missing")
      expect(page).to_not have_content("Failed candy")
    end
  end
end
