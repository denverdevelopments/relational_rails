class Bakery < ApplicationRecord
  validates :name, presence: true
  # validates :open_on_weekends, presence: true
  validates :hours_open, presence: true, numericality: true
  has_many :pastries
end
