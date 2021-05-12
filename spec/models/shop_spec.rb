require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe 'relationships' do
    it { should have_many(:candies) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    # it { should validate_inclusion_of(:sells_drinks) }
    it { should validate_presence_of(:varieties) }
    it { should validate_numericality_of(:varieties) }
  end

end
