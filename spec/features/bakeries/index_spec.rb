require 'rails_helper'

RSpec.describe 'the bakery index page' do
  before :each do
    @bakery_1 = Bakery.create!(name: "Black Dalia Flour Bakery", open_on_weekends: false, hours_open: 8)
    @bakery_2 = Bakery.create!(name: "The Hawk Spot Bakery", open_on_weekends: true, hours_open: 6)
  end

  it 'shows the bakery name' do
    visit '/bakeries'

    expect(page).to have_content(@bakery_1.name)
  end

  it 'can list by most recently created' do
    visit '/bakeries'

    expect(page).to have_content(@bakery_1.created_at.strftime('%D, %r'))
    expect(page).to have_content(@bakery_2.created_at.strftime('%D, %r'))
  end

  it 'has a link to the pastires index' do
    visit '/bakeries'

    expect(page).to have_content("Delicious Pastries")

    click_link 'Delicious Pastries'

    expect(current_path).to eq('/pastries')
  end

  it 'has a link to create a new bakery' do
    visit '/bakeries'

    expect(page).to have_link("New Bakery")

    click_link 'New Bakery'

    expect(current_path).to eq('/bakeries/new')
  end

end
