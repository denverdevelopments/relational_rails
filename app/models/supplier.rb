class Supplier < ApplicationRecord
  has_many :supply_trucks, dependent: :destroy


end
