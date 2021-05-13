# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_12_212941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bakeries", force: :cascade do |t|
    t.string "name"
    t.boolean "open_on_weekends"
    t.integer "hours_open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candies", force: :cascade do |t|
    t.string "type"
    t.boolean "all_natural"
    t.integer "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shop_id"
    t.index ["shop_id"], name: "index_candies_on_shop_id"
  end

  create_table "pastries", force: :cascade do |t|
    t.string "name"
    t.boolean "savory_pastry"
    t.integer "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bakery_id"
    t.index ["bakery_id"], name: "index_pastries_on_bakery_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.boolean "sells_drinks"
    t.integer "varieties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "candies", "shops"
  add_foreign_key "pastries", "bakeries"
end
