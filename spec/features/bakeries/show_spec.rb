require 'rails_helper'

RSpec.describe 'the bakery show page', type: :feature do
  before(:each) do
    @bakery_1 = Bakery.create!(name: "Black Dalia Flour Bakery", open_on_weekends: false, hours_open: 8)
    @bakery_2 = Bakery.create!(name: "The Hawk Spot Bakery", open_on_weekends: true, hours_open: 6)
  end

  it 'shows the bakery name' do
    visit "/bakeries/#{@bakery_1.id}"

    expect(page).to have_content(@bakery_1.name)
  end

  it 'shows the baker attributes' do
    visit "/bakeries/#{@bakery_1.id}"

    expect(page).to have_content("Open on the weekends:")
    expect(page).to have_content(@bakery_1.open_on_weekends)
    expect(page).to have_content("Amount of hours open per day:")
    expect(page).to have_content(@bakery_1.hours_open)
  end

  it 'should not have content from another bakery' do
    visit "/bakeries/#{@bakery_1.id}"

    expect(page).to_not have_content(@bakery_2.name)
  end
end
