require 'rails_helper'

RSpec.describe 'the shops index', type: :feature do
  before(:each) do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
    @shop_2 = Shop.create!(name: 'Gimme Some Suga', sells_drinks: false, varieties: 205)
  end

  it 'has a link to bakeries index' do
      visit "/shops"
    expect(page).to have_link("Bakeries Index")
    click_link("Bakeries Index")
    expect(current_path).to eq("/bakeries")
  end

  it 'has a link to pastries index' do
      visit "/shops"
    expect(page).to have_link("Pastries Index")
    click_link("Pastries Index")
    expect(current_path).to eq("/pastries")
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

  it 'lists of all shop names, created at times' do
    visit "/shops"

    within("#shop-index") do

      within("#shop-#{@shop_1.id}") do
        expect(page).to have_content(@shop_1.name)
        expect(page).to have_content(@shop_1.created_at.strftime("%A, %B %d, %Y"))
      end

      within("#shop-#{@shop_2.id}") do
        expect(page).to have_content(@shop_2.name)
        expect(page).to have_content(@shop_2.created_at.strftime("%A, %B %d, %Y"))
      end

      # expect(page).to have_link(@shop_1.percent)
      # click_link(@tv_1.percent)
      # expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts/#{@tv_1.id}")
    end
  end     #shop index - us#1

  it 'has links to Edit' do
    visit "/shops"

    within("#shop-index") do

      within("#shop-#{@shop_1.id}") do
          visit "/shops"
        expect(page).to have_content(@shop_1.name)
        expect(page).to have_link("UPDATE #{@shop_1.name}")
          click_link "UPDATE #{@shop_1.name}"
          # save_and_open_page
        expect(current_path).to eq("/shops/#{@shop_1.id}/edit")
      end

      within("#shop-#{@shop_2.id}") do
          visit "/shops"
          sleep 5
          expect(page).to have_content(@shop_2.name)
          expect(page).to have_link("UPDATE #{@shop_2.name}")
            click_link "UPDATE #{@shop_2.name}"
          save_and_open_page
          expect(current_path).to eq("/shops/#{@shop_2.id}/edit")
      end
    end
  end     #shop edit link - us#12

  describe 'has links to Delete' do
    visit "/shops"

    within("#shop-index") do

      within("#shop-#{@shop_1.id}") do
        it 'has link to Delete' do
            # visit "/shops"
          expect(page).to have_content(@shop_1.name)
          expect(page).to have_link("( Delete )")
        # end
        #
        # it 'deletes' do
          #   click_link "( Delete )"
          # expect(current_path).to eq("/shops")
          # expect(page).to_not have_content(@shop_1.name)
        end
      end

      # within("#shop-#{@shop_2.id}") do
      #     visit "/shops"
      #     expect(page).to have_content(@shop_2.name)
      #     expect(page).to have_link("( Delete )")
      #       click_link "( Delete )"
      #     expect(current_path).to eq("/shops")
      #     expect(page).to_not have_content(@shop_2.name)
      # end
    end
  end     #shop delete link - us#?

  it 'has a link to create New Shop' do
      visit "/shops"
    expect(page).to have_link("Create New Shop")
    click_link("Create New Shop")
    expect(current_path).to eq("/shops/new")
  end


  # expect(page).to have_link(@shop_1.percent)
  # click_link(@tv_1.percent)
  # expect(current_path).to eq("/merchants/#{@merchant_1.id}/discounts/#{@tv_1.id}")
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
