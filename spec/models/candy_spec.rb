require 'rails_helper'

RSpec.describe Candy, type: :model do
  describe 'relationships' do
    it { should belong_to(:shop) }
  end

  describe "validations" do
    it { should validate_presence_of(:brand) }
    # it { should validate_inclusion_of(:all_natural) }
    it { should validate_presence_of(:calories) }
    it { should validate_numericality_of(:calories) }
  end

end
