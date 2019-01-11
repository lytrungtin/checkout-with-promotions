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

ActiveRecord::Schema.define(version: 20190111192824) do

  create_table "products", force: :cascade do |t|
    t.string "product_code"
    t.string "name"
    t.decimal "price", precision: 8, scale: 2
    t.integer "quantity_discount"
    t.decimal "price_discount", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_code"], name: "index_products_on_product_code", unique: true
  end

  create_table "promotions", force: :cascade do |t|
    t.string "code"
    t.decimal "min_total_price", precision: 8, scale: 2
    t.integer "discount_rate"
    t.boolean "includes_discount_item"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_promotions_on_code", unique: true
  end

end
