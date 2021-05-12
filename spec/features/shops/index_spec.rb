require 'rails_helper'

RSpec.describe 'the shops index', type: :feature do
  before(:each) do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
    @shop_2 = Shop.create!(name: 'Candy Corral', sells_drinks: false, varieties: 45)
  end

  it 'has a link to main welcome page' do
    visit "/shops"
      expect(page).to have_link("Welcome")
      click_link("Welcome")
      expect(current_path).to eq("/")
  end

  it 'has a link to shops index' do
    visit "/shops"
      expect(page).to have_link("Candy Shops Index")
      click_link("Candy Shops Index")
      expect(current_path).to eq("/shops")
  end

  it 'has a link to candies index' do
    visit "/shops"
      expect(page).to have_link("Candies Index")
      click_link("Candies Index")
      expect(current_path).to eq("/candies")
  end

  it 'lists of all shops' do
    visit "/shops"

    within("#shop-index") do

      within("#shop-#{@shop_1.id}") do
        expect(page).to have_content(@shop_1.name)
        # expect(page).to have_link(@shop_1.percent)
      end

      within("#shop-#{@shop_2.id}") do
        expect(page).to have_content(@shop_2.name)
      end

      # click_link(@tv_1.percent)
      # expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts/#{@tv_1.id}")
    end
  end     #shop index - us#1

  # it 'has Enable button by Disabled items' do
  #   visit "/merchants/#{@jerde.id}/items"
  #
  #   expect(page).to have_content(@qui.name)
  #   expect(page).to have_button("Enable")
    # click_button "Enable"
    # expect(current_path).to eq("/merchants/#{@jerde.id}/items")
    # expect(page).to have_button("Disable")
    # expect(page).to_not have_button("Enable")
  # end

  # it 'shows two sections, "Enabled Items" & "Disabled Items"' do
  #   visit "/shops"
  #
  #   expect(page).to have_content("Enabled Items")
  #   expect(page).to have_content(@autem.name)
  #   expect(page).to have_button("Disable")
  #   expect(page).to have_content(@ea.name)
  #
  #   expect(page).to have_content("Disabled Items")
  #   expect(page).to have_content(@qui.name)
  #   expect(page).to have_button("Enable")
  # end     #merchant items us#5
  #
  # it "has a link to 'Create NEW Item'" do
  #   visit "/merchants/#{@jerde.id}/items"
  #     click_on "Create NEW Item"
  #   expect(current_path).to eq("/merchants/#{@jerde.id}/items/new")
  # end     #merchant items us#6-1
  #
  # it "has form to create new item" do
  #     visit "/merchants/#{@jerde.id}/items/new"
  #     # save_and_open_page
  #   expect(page).to have_content('New Item')
  #   # expect(find('form')).to have_content('Name')
  #   # expect(find('form')).to have_content('Description')
  #   # expect(find('form')).to have_content('Unit price')
  #   expect(page).to have_button("Submit")
  #   #   click_on "Submit"
  #   # expect(current_path).to eq("/merchants/#{@jerde.id}/items")
  #
  # end     #merchant items us#6-2
  #
  # describe 'top five merchants by revenue section' do
  #   # it 'shows section for 5 Most Popular Items"' do
  #   #   visit "/merchants/#{@jerde.id}/items"
  #   # end
  #
  # end

end
