class CreateBakeries < ActiveRecord::Migration[5.2]
  def change
    create_table :bakeries do |t|
      t.string :name
      t.boolean :open_on_weekends
      t.integer :hours_open

      t.timestamps
    end
  end
end
