require 'rails_helper'

RSpec.describe 'new pastry page' do
  before :each do
    @bakery_2 = Bakery.create!(name: "The Hawk Spot Bakery", open_on_weekends: true, hours_open: 6)
    @pastry_2 = @bakery_2.pastries.create!(name: "Paw Print Cookies", savory_pastry: false, calories: 278)
    @pastry_3 = @bakery_2.pastries.create!(name: "Resting Dogs hotdog buns", savory_pastry:true, calories: 200)
  end

  it 'has a link to the bakery index page' do
    visit "/bakeries/#{@bakery_2.id}/pastries"

    expect(page).to have_link('Radical Bakeries')

    click_link 'Radical Bakeries'

    expect(current_path).to eq('/bakeries')
  end

  it 'has a link to the pastry index page' do
    visit "/bakeries/#{@bakery_2.id}/pastries"

    expect(page).to have_link('Delicious Pastries')

    click_link 'Delicious Pastries'

    expect(current_path).to eq('/pastries')
  end

  it 'can create a new pastry' do
    visit "/bakeries/#{@bakery_2.id}/pastries"

    click_link 'New Pastry'

    expect(current_path).to eq("/bakeries/#{@bakery_2.id}/pastries/new")

    fill_in 'Name', with: 'Paper Plane Pie'
    select 'false', from: 'Savory pastry'
    fill_in 'Calories', with: 1200
    click_on 'Create Pastry'

    expect(current_path).to eq("/bakeries/#{@bakery_2.id}/pastries")
    expect(page).to have_content('Paper Plane Pie')
  end
end
