class Candy < ApplicationRecord
  validates :brand, presence: true
  validates :all_natural, inclusion:[true, false], exclusion:[nil]
  validates :calories, presence: true, numericality: true

  belongs_to :shop
end
