require 'rails_helper'

RSpec.describe 'the create new candy shop form', type: :feature do
  before(:each) do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
    @shop_2 = Shop.create!(name: 'Gimme Some Suga', sells_drinks: false, varieties: 205)
  end

  it 'has form to create new shop' do
      visit "/shops/#{@shop_1.id}/new"
      # save_and_open_page
    expect(page).to have_content('New Candy Shop')
    expect(find('form')).to have_content('Name')
    expect(find('form')).to have_content('Sells drinks')
    expect(find('form')).to have_content('Candy varieties')
    expect(page).to have_button("Create New Shop")
      click_on "Create New Shop"
  end

  it "creates a new shop" do
    visit "/shops/#{@shop_1.id}/new"

    fill_in "Name", with: "Test shop name"
    select "true", from: "Sells drinks"
    fill_in "Candy varieties", with: 34
      click_button "Create New Shop"
      expect(current_path).to eq("/shops")
    expect(page).to have_content("Test shop name")
  end

  # describe 'sad path' do
  #   it 'does not allow creating an incomplete discount' do
  #     visit "/shops/#{@shop_1.id}/new"
  #
  #     fill_in "Quantity", with: 2
  #       click_button "Create New Discount"
  #     expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts/new")
  #     expect(page).to have_content("ERROR: Please enter percentage & quantity")
  #   end
  # end
end
