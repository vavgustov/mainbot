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

ActiveRecord::Schema.define(version: 20180326180549) do

  create_table "foodbot_deals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "product_id"
    t.bigint "retailer_id"
    t.string "description"
    t.string "image"
    t.string "discount"
    t.string "price_new"
    t.string "price_old"
    t.string "quantity"
    t.string "date"
    t.date "download_date"
    t.index ["product_id"], name: "index_foodbot_deals_on_product_id"
    t.index ["retailer_id"], name: "index_foodbot_deals_on_retailer_id"
  end

  create_table "foodbot_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "title"
    t.boolean "active"
    t.index ["title"], name: "index_foodbot_products_on_title", unique: true
  end

  create_table "foodbot_retailers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "title"
    t.string "url"
    t.string "day"
    t.boolean "active"
    t.index ["title"], name: "index_foodbot_retailers_on_title", unique: true
  end

  create_table "octobot_languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "title"
    t.boolean "active"
  end

  create_table "octobot_trends", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "language_id"
    t.string "title"
    t.text "description"
    t.string "language_selector"
    t.string "link"
    t.integer "stars"
    t.integer "forks"
    t.string "stats"
    t.boolean "checked"
    t.date "download_date"
    t.index ["language_id"], name: "index_octobot_trends_on_language_id"
    t.index ["title"], name: "index_octobot_trends_on_title", unique: true
  end

end
