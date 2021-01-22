# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_20_111957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "borrower_id"
    t.datetime "start_rent"
    t.datetime "end_rent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["borrower_id"], name: "index_bookings_on_borrower_id"
    t.index ["item_id"], name: "index_bookings_on_item_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_filters", id: false, force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "filter_id"
    t.index ["category_id"], name: "index_categories_filters_on_category_id"
    t.index ["filter_id"], name: "index_categories_filters_on_filter_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "population"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "filters", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["owner_id"], name: "index_items_on_owner_id"
  end

  create_table "items_options", id: false, force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "option_id"
    t.index ["item_id"], name: "index_items_options_on_item_id"
    t.index ["option_id"], name: "index_items_options_on_option_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "value"
    t.bigint "filter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["filter_id"], name: "index_options_on_filter_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "reviewer_id"
    t.string "reviewable_type"
    t.bigint "reviewable_id"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable_type_and_reviewable_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "adress"
    t.bigint "city_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.index ["city_id"], name: "index_users_on_city_id"
  end

end
