require 'rails_helper'

RSpec.describe 'new pastry page' do
  it 'has a link to the bakery index page' do
    visit '/pastries/new'

    expect(page).to have_link('Radical Bakeries')

    click_link 'Radical Bakeries'

    expect(current_path).to eq('/bakeries')
  end

  it 'has a link to the pastry index page' do
    visit '/pastries/new'

    expect(page).to have_link('Delicious Pastries')

    click_link 'Delicious Pastries'

    expect(current_path).to eq('/pastries')
  end

  it 'can create a new pastry' do
    visit '/pastries'

    click_link 'New Pastry'

    expect(current_path).to eq('/pastries/new')

    # fill_in 'Pastry name', with: 'Paper Plane Pie'
    click_on 'Create Pastry'

    expect(current_path).to eq('/pastries')
    # expect(page).to have_content('Paper Plane pie')
  end
end
