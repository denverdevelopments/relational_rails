require 'rails_helper'

RSpec.describe Shop, type: :model do
  before(:each) do
    @shop_1 = Shop.create!(name: 'Stickys Sweets', sells_drinks: true, varieties: 110)
    sleep 10
    @shop_2 = Shop.create!(name: 'Gimme Some Suga', sells_drinks: false, varieties: 205)
    sleep 10
    @shop_3 = Shop.create!(name: 'Candy Corral', sells_drinks: true, varieties: 45)
  end

  describe 'relationships' do
    it { should have_many(:candies) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_inclusion_of(:sells_drinks).in_array([true, false])}
    it { should validate_presence_of(:varieties) }
    it { should validate_numericality_of(:varieties) }
  end

  describe 'class methods' do
    describe '.newest_first' do
      it 'orders shops by most recently created first' do
        expect(Shop.newest_first).to eq([@shop_3, @shop_2, @shop_1])
      end
    end
  end

end
