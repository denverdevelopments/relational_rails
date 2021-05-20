require 'rails_helper'

RSpec.describe Bakery, type: :model do
  context 'relationships' do
    it { should have_many(:pastries) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:hours_open) }
    it { should validate_numericality_of(:hours_open) }
  end

  context 'index page' do
    it 'can list the bakeries in order of creation' do
      Pastry.destroy_all
      Bakery.destroy_all

      bakery_1 = Bakery.create!(name: "Black Dalia Flour Bakery", hours_open: 6, created_at: 1.seconds.ago)
      bakery_2 = Bakery.create!(name: "The Hawk Spot Bakery", hours_open: 8, created_at: 10.seconds.ago)
      bakery_3 = Bakery.create!(name: "Rollin' in the Dough Bakery", hours_open: 5, created_at: 5.seconds.ago)

      expect(Bakery.order_by_creation_time.to_a).to eq([bakery_1, bakery_3, bakery_2])
    end
  end

  context 'alphabetical order' do
    it 'can list pastries in alphabetical order' do
      Pastry.destroy_all
      Bakery.destroy_all

      @bakery_1 = Bakery.create!(name: "Black Dalia Flour Bakery", open_on_weekends: false, hours_open: 8)
      @pastry_01 = @bakery_1.pastries.create!(name: "I'd kill for those buns", savory_pastry: true, calories: 355)
      @pastry_02 = @bakery_1.pastries.create!(name: "Betty Buns", savory_pastry: true, calories: 400)
      @pastry_03 = @bakery_1.pastries.create!(name: "Lay me to rest maple bar", savory_pastry: false, calories: 150)

      @bakery_2 = Bakery.create!(name: "The Hawk Spot Bakery", open_on_weekends: true, hours_open: 6)
      @pastry_2 = @bakery_2.pastries.create!(name: "Resting Dogs hotdog buns", savory_pastry:true, calories: 200)
      @pastry_3 = @bakery_2.pastries.create!(name: "Paw Print Cookies", savory_pastry: false, calories: 278)

      @bakery_3 = Bakery.create!(name: "Rollin' in the Dough Bakery", open_on_weekends: true, hours_open: 6)
      @pastry_4 = @bakery_3.pastries.create!(name: "Gold Coin mini cookies", savory_pastry: false, calories: 100)
      @pastry_5 = @bakery_3.pastries.create!(name: "Rollin in the Cardamom rolls", savory_pastry: false, calories: 600)

      expect(@bakery_1.alphabetical_pastries).to eq([@pastry_02, @pastry_01, @pastry_03])
      expect(@bakery_2.alphabetical_pastries).to eq([@pastry_3, @pastry_2])
      expect(@bakery_3.alphabetical_pastries).to eq([@pastry_4, @pastry_5])
    end
  end
end
