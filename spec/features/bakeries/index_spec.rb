require 'rails_helper'

RSpec.describe 'the bakery index show page' do
  before :each do
    @bakery_1 = Bakery.create!(name: "Black Dalia Flour Bakery", open_on_weekends: false, hours_open: 8)
    @bakery_2 = Bakery.create!(name: "The Hawk Spot Bakery", open_on_weekends: true, hours_open: 6)
  end

  it 'shows the bakery name' do
    visit '/bakeries'

    expect(page).to have_content(@bakery_1.name)
  end
end
