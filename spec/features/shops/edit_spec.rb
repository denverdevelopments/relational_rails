require 'rails_helper'

RSpec.describe 'the edit candy shop form', type: :feature do
  before(:each) do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
  end

  it 'has form to edit shop' do
      visit "/shops/#{@shop_1.id}/edit"
    expect(page).to have_content('Update Candy Shop')
    expect(find('form')).to have_content('Name')
    expect(find('form')).to have_content('Sells drinks')
    expect(find('form')).to have_content('Varieties')
    expect(page).to have_button("Submit Shop Update")
    page.find("input[value='#{@shop_1.name}']")
    page.find("input[value='#{@shop_1.varieties}']")
    # page.find('input[value="Stickys Sweets"]')
    # page.find('input[value=110]')  
  end

  it 'edits the shop' do
      visit "/shops/#{@shop_1.id}"
    expect(page).to have_content(@shop_1.name)
    expect(page).to have_link("Update Candy Shop")
      click_link "Update Candy Shop"
    expect(current_path).to eq("/shops/#{@shop_1.id}/edit")
    fill_in "Name", with: "Test shop name"
    select "true", from: "Sells drinks"
    fill_in "Varieties", with: 42
      click_button "Submit Shop Update"
      expect(current_path).to eq("/shops/#{@shop_1.id}")
    expect(page).to have_content("Test shop name")
  end

  describe 'sad path' do
    it 'does not allow creating an incomplete shop edit' do
      visit "/shops/#{@shop_1.id}/edit"

      fill_in "Name", with: nil
        click_button "Submit Shop Update"
      expect(current_path).to eq("/shops/#{@shop_1.id}")
      # expect(page).to have_content("Error: Required information missing")
    end
  end
end
