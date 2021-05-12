class Candy < ApplicationRecord
  validates :type, presence: true
  validates :all_natural, presence: true
  validates :calories, presence: true, numericality: true

  belongs_to :shop
end
