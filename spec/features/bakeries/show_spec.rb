require 'rails_helper'

RSpec.describe 'the bakery show page', type: :feature do
  before :each do
    @bakery_1 = Bakery.create!(name: "Black Dalia Flour Bakery", open_on_weekends: false, hours_open: 8)
    @pastry_1 = @bakery_1.pastries.create!(name: "I'd kill for those buns", savory_pastry: true, calories: 355)

    @bakery_2 = Bakery.create!(name: "The Hawk Spot Bakery", open_on_weekends: true, hours_open: 6)
    @pastry_2 = @bakery_2.pastries.create!(name: "Paw Print Cookies", savory_pastry: false, calories: 278)
    @pastry_3 = @bakery_2.pastries.create!(name: "Resting Dogs hotdog buns", savory_pastry:true, calories: 200)

    @bakery_3 = Bakery.create!(name: "Rollin' in the Dough Bakery", open_on_weekends: true, hours_open: 6)
    @pastry_4 = @bakery_3.pastries.create!(name: "Gold Coin mini cookies", savory_pastry: false, calories: 100)
    @pastry_5 = @bakery_3.pastries.create!(name: "Rollin in the Cardamom rolls", savory_pastry: false, calories: 600)
  end

  it 'shows the bakery name' do
    visit "/bakeries/#{@bakery_1.id}"

    expect(page).to have_content(@bakery_1.name)
  end

  it 'shows the bakery attributes' do
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

  it 'should show the amount of pastries a bakery has' do
    visit "/bakeries/#{@bakery_1.id}"

    expect(page).to have_content("#{@bakery_1.pastries.count}")

    visit "/bakeries/#{@bakery_2.id}"

    expect(page).to have_content("#{@bakery_2.pastries.count}")
    expect(page).to_not have_content("#{@bakery_1.pastries.count}")
  end
end
