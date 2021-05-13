class Pastry < ApplicationRecord
  validates :name, presence: true
  # validates :savory_pastry, presence: true
  validates :calories, presence: true, numericality: true
  belongs_to :bakery
end
