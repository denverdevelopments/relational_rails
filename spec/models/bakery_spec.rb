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

  context 'created at' do
    it 'can list the bakeries in order of creation' do
      expect()
    end
  end
end
