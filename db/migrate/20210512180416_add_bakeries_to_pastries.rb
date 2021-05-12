class AddBakeriesToPastries < ActiveRecord::Migration[5.2]
  def change
    add_reference :pastries, :bakeries, foreign_key: true
  end
end
