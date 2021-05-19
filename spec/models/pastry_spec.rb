require 'rails_helper'

RSpec.describe Pastry, type: :model do
  context 'relationships' do
    it { should belong_to(:bakery) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    # it { should validate_presence_of(:savory_pastry) }
    it { should validate_presence_of(:calories) }
    it { should validate_numericality_of(:calories) }
  end

  context 'column conditions' do
    Pastry.destroy_all
    Bakery.destroy_all

    it 'only shows true boolean value pastries' do
      @bakery_1 = Bakery.create!(name: "Black Dalia Flour Bakery", open_on_weekends: false, hours_open: 8)
      @pastry_1 = @bakery_1.pastries.create!(name: "I'd kill for those buns", savory_pastry: true, calories: 355)

      @bakery_2 = Bakery.create!(name: "The Hawk Spot Bakery", open_on_weekends: true, hours_open: 6)
      @pastry_2 = @bakery_2.pastries.create!(name: "Paw Print Cookies", savory_pastry: false, calories: 278)
      @pastry_3 = @bakery_2.pastries.create!(name: "Resting Dogs hotdog buns", savory_pastry:true, calories: 200)

      @bakery_3 = Bakery.create!(name: "Rollin' in the Dough Bakery", open_on_weekends: true, hours_open: 6)
      @pastry_4 = @bakery_3.pastries.create!(name: "Gold Coin mini cookies", savory_pastry: false, calories: 100)
      @pastry_5 = @bakery_3.pastries.create!(name: "Rollin in the Cardamom rolls", savory_pastry: false, calories: 600)

      expect(Pastry.truly_savory).to eq([@pastry_1, @pastry_3])
      expect(Pastry.truly_savory).to_not eq([@pastry_1, @pastry_2, @pastry_3])
    end
  end
end
