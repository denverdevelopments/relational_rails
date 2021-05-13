require 'rails_helper'

RSpec.describe 'the shop show page', type: :feature do
  it 'shows the shop name, attributes' do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
    @shop_2 = Shop.create!(name: 'Candy Corral', sells_drinks: false, varieties: 45)

      visit "/shops/#{@shop_1.id}"

    expect(page).to have_content(@shop_1.name)
    expect(page).to have_content("Shop ID#: #{@shop_1.id}")
    expect(page).to have_content("Sells drinks?: #{@shop_1.sells_drinks}")
    expect(page).to have_content("How many candy varieties?: #{@shop_1.varieties}")
    expect(page).to_not have_content(@shop_2.name)

    # expect(page).to have_link("Edit Discount")
    #   click_link "Edit Discount"
    # expect(current_path).to eq("/merchants/#{merchant_1.id}/discounts/#{discount_1.id}/edit")
  end
end
