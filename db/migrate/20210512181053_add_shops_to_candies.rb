class AddShopsToCandies < ActiveRecord::Migration[5.2]
  def change
    add_reference :candies, :shop, foreign_key: true
  end
end
