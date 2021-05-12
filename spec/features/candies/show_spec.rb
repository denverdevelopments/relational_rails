require 'rails_helper'

RSpec.describe 'the candy show page', type: :feature do
  it 'shows the candy attributes' do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
    @candy_1 = @shop_1.candies.create!(name: 'Honey Stick', all_natural: true, calories: 65)
    @candy_2 = @shop_1.candies.create!(name: 'Jelly Belly', all_natural: false, calories: 120)

      visit "/candies/#{@candy_1.id}"

    expect(page).to have_content("CANDY ##{@candy_1.id}")
    expect(page).to have_content(@candy_1.type)
    expect(page).to have_content("All Natural? --  #{@candy_1.all_natural}")
    expect(page).to have_content("How many calories? -- #{@candy_1.calories} cal")
    expect(page).to_not have_content(@candy_2.type)

    # expect(page).to have_link("Edit Discount")
    #   click_link "Edit Discount"
    # expect(current_path).to eq("/merchants/#{merchant_1.id}/discounts/#{discount_1.id}/edit")
  end
end
