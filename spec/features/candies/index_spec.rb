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

    # within("#candy-index") do

      # within("#candy-#{@candy_1.id}") do
          visit "/candies"
        expect(page).to have_content(@candy_1.brand)
        expect(page).to have_button("Update #{@candy_1.brand}")
          click_button "Update #{@candy_1.brand}"
        expect(current_path).to eq("/candies/#{@candy_1.id}/edit")
      # end

      # within("#candy-#{@candy_2.id}") do
      #   sleep 5
      #     visit "/candies"
      #   expect(page).to have_content(@candy_2.brand)
      #   expect(page).to have_button("Update #{@candy_2.brand}")
      #     click_button "Update #{@candy_2.brand}"
      #   expect(current_path).to eq("/candies/#{@candy_2.id}/edit")
      # end
    # end
  end     #candy edit link - us#17

  it 'has links to delete' do
    visit "/candies"

    within("#candy-index") do

      within("#candy-#{@candy_1.id}") do
          visit "/candies"
        expect(page).to have_content(@candy_1.brand)
        expect(page).to have_button("( Delete )")
          click_button "( Delete )"
        # expect(page).to_not have_content(@candy_1.brand)
      end
    end
  end     #candy delete link - us#20





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
