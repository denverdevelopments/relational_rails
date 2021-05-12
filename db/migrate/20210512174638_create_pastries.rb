class CreatePastries < ActiveRecord::Migration[5.2]
  def change
    create_table :pastries do |t|
      t.string :name
      t.boolean :savory_pastry
      t.integer :calories

      t.timestamps
    end
  end
end
