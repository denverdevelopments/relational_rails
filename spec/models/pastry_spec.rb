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
end
