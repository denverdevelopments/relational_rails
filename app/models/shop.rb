class Shop < ApplicationRecord
  validates :name, presence: true
  validates :sells_drinks, presence: true
  validates :varieties, presence: true, numericality: true

  has_many :candies
end
