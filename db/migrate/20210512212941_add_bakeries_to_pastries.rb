class AddBakeriesToPastries < ActiveRecord::Migration[5.2]
  def change
    add_reference :pastries, :bakery, foreign_key: true
  end
end
