require 'rails_helper'

RSpec.describe 'the shop show page', type: :feature do
  it 'shows the shop name, attributes' do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)

    # merchant_1 = Merchant.create!(name: "AA")
    # discount_1 = merchant_1.discounts.create!(percent: 28, quantity: 5)

    visit "/shops/#{@shop_1.id}"

    expect(page).to have_content("SHOP ##{@shop_1.id}")
    expect(page).to have_content(@shop_1.name)
    expect(page).to have_content("Sell drinks? #{@shop_1.sells_drinks}")
    expect(page).to have_content("How many candy varieties? #{@shop_1.varieties}")
    # expect(page).to have_link("Edit Discount")
    #   click_link "Edit Discount"
    # expect(current_path).to eq("/merchants/#{merchant_1.id}/discounts/#{discount_1.id}/edit")
  end
end
