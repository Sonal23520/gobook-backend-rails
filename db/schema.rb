# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_22_183442) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name", limit: 100
    t.integer "price"
    t.integer "grade"
    t.integer "qty"
    t.text "image_url"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "categories_id", null: false
    t.bigint "products_id", null: false
    t.index ["categories_id"], name: "index_books_on_categories_id"
    t.index ["products_id"], name: "index_books_on_products_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 100
    t.text "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.bigint "orders_id", null: false
    t.bigint "books_id", null: false
    t.bigint "products_id", null: false
    t.integer "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["books_id"], name: "index_order_details_on_books_id"
    t.index ["orders_id"], name: "index_order_details_on_orders_id"
    t.index ["products_id"], name: "index_order_details_on_products_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "email", limit: 50
    t.string "address", limit: 100
    t.string "city", limit: 50
    t.string "district", limit: 20
    t.integer "mobile_no"
    t.integer "item_count"
    t.integer "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "books", "categories", column: "categories_id"
  add_foreign_key "books", "products", column: "products_id"
  add_foreign_key "order_details", "books", column: "books_id"
  add_foreign_key "order_details", "orders", column: "orders_id"
  add_foreign_key "order_details", "products", column: "products_id"
end
