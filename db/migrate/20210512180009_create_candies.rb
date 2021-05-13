class CreateCandies < ActiveRecord::Migration[5.2]
  def change
    create_table :candies do |t|
      t.string :brand
      t.boolean :all_natural
      t.integer :calories

      t.timestamps
    end
  end
end
