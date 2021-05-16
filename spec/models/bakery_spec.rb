require 'rails_helper'

RSpec.describe Bakery, type: :model do
  context 'relationships' do
    it { should have_many(:pastries) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    # it { should validate_presence_of(:open_on_weekends) }
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
end
