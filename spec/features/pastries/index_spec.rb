require 'rails_helper'

RSpec.describe 'the pastry index page' do
  before :each do
    @bakery_1 = Bakery.create!(name: "The Hawk Spot Bakery", open_on_weekends: true, hours_open: 6)
    @pastry_1 = @bakery_1.pastries.create!(name: "Paw Print Cookies", savory_pastry: false, calories: 278)
    @pastry_2 = @bakery_1.pastries.create!(name: "Resting Dogs hotdog buns", savory_pastry:true, calories: 200)
  end

  it 'show the pastry name' do
    visit '/pastries'

    expect(page).to have_content(@pastry_1.name)
    expect(page).to have_content(@pastry_2.name)
  end

  it 'shows if it is a savory pastry' do
    visit '/pastries'

    expect(page).to have_content(@pastry_1.savory_pastry?)
    expect(page).to have_content(@pastry_2.savory_pastry?)
  end

  it 'shows the calories of the pastry' do
    visit '/pastries'

    expect(page).to have_content(@pastry_1.calories)
    expect(page).to have_content(@pastry_2.calories)
  end
end
