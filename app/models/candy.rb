class Candy < ApplicationRecord
  validates :brand, presence: true
  validates :all_natural, inclusion:[true, false], exclusion:[nil]
  validates :calories, presence: true, numericality: true

  belongs_to :shop

  def self.only_true
    where(all_natural: true)
  end

  def self.alphabetical
    order(brand: :asc)
  end
end
