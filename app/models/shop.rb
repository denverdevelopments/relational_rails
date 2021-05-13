class Shop < ApplicationRecord
  validates :name, presence: true
  validates :sells_drinks, inclusion:[true, false], exclusion:[nil]
  validates :varieties, presence: true, numericality: true

  has_many :candies
end
