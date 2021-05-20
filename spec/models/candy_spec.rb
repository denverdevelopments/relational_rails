require 'rails_helper'

RSpec.describe Candy, type: :model do
  describe 'relationships' do
    it { should belong_to(:shop) }
  end

  describe "validations" do
    it { should validate_presence_of(:brand) }
    it { should validate_inclusion_of(:all_natural).in_array([true, false])}
    it { should validate_presence_of(:calories) }
    it { should validate_numericality_of(:calories) }
  end

  before(:each) do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
    @candy_1 = @shop_1.candies.create!(brand: 'Honey Stick', all_natural: true, calories: 65)
    @candy_2 = @shop_1.candies.create!(brand: 'Jelly Belly', all_natural: false, calories: 120)
    @candy_3 = @shop_1.candies.create!(brand: 'Astro-pops', all_natural: true, calories: 48)

  end

  describe "class methods" do
    it 'shows .only_true all natural candies' do
      expect(@shop_1.candies.only_true).to eq([@candy_1, @candy_3])
    end

    it 'shows .alphabetical ordered candies' do
      expect(@shop_1.candies.alphabetical).to eq([@candy_3, @candy_1, @candy_2])
    end
  end
end
