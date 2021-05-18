class Shop < ApplicationRecord
  validates :name, presence: true
  validates :sells_drinks, inclusion:[true, false], exclusion:[nil]
  validates :varieties, presence: true, numericality: true

  has_many :candies, dependent: :destroy ##

  def self.newest_first
    Shop.order(created_at: :desc)
  end

  # def how_much_candy
  #   self.candies.count
  # end
end
