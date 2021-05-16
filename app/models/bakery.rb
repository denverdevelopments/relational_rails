class Bakery < ApplicationRecord
  validates :name, presence: true
  # validates :open_on_weekends, presence: true
  validates :hours_open, presence: true, numericality: true
  has_many :pastries

  def self.order_by_creation_time
    order(created_at: :desc)
  end
end
