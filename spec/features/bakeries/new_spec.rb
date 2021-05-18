require 'rails_helper'

RSpec.describe 'new bakery form' do
  it 'has a link to the bakery index page' do
    visit '/bakeries/new'

    expect(page).to have_link('Radical Bakeries')

    click_link 'Radical Bakeries'

    expect(current_path).to eq('/bakeries')
  end

  it 'has a link to the pastry index page' do
    visit '/bakeries/new'

    expect(page).to have_link('Delicious Pastries')

    click_link 'Delicious Pastries'

    expect(current_path).to eq('/pastries')
  end

  it 'can create a new bakery' do
    visit '/bakeries'

    click_link 'New Bakery'

    expect(current_path).to eq('/bakeries/new')

    fill_in 'Name', with: 'The Sweet Spot'
    select 'true', from: 'Open on weekends'
    fill_in 'Hours open', with: 8
    click_on 'Create Bakery'

    expect(current_path).to eq('/bakeries')
    expect(page).to have_content('The Sweet Spot')
  end
end
