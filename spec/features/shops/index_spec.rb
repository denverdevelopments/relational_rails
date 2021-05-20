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
        expect(page).to have_button("Update #{@shop_1.name}")
        expect(page).to have_button("( Delete #{@shop_1.name} )")
      end

      within("#shop-#{@shop_2.id}") do
        expect(page).to have_content(@shop_2.name)
        expect(page).to have_content(@shop_2.created_at.strftime("%A, %B %d, %Y"))
        expect(page).to have_button("Update #{@shop_2.name}")
        expect(page).to have_button("( Delete #{@shop_2.name} )")
      end
    end
  end     #shop index - us#1

  it 'has a link to create New Shop' do
      visit "/shops"
    expect(page).to have_link("Create New Shop")
    click_link("Create New Shop")
    expect(current_path).to eq("/shops/new")
  end     #shop create link - us#11

  it 'has link to Update' do
      visit "/shops"
    expect(page).to have_content(@shop_1.name)
    expect(page).to have_button("Update #{@shop_1.name}")
      click_button "Update #{@shop_1.name}"
    expect(current_path).to eq("/shops/#{@shop_1.id}/edit")

      visit "/shops"
    expect(page).to have_content(@shop_2.name)
    expect(page).to have_button("Update #{@shop_2.name}")
      click_button "Update #{@shop_2.name}"
    expect(current_path).to eq("/shops/#{@shop_2.id}/edit")
  end     #shop edit link - us#12

  it 'has links to delete' do
      visit "/shops"

    within("#shop-#{@shop_1.id}") do
      expect(page).to have_content(@shop_1.name)
      expect(page).to have_button("( Delete )")
        click_button "( Delete )"
    end

    expect(current_path).to eq("/shops")
    expect(page).to_not have_content(@shop_1.name)
  end     #shop delete link - us#19
end
