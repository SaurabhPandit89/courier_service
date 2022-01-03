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

ActiveRecord::Schema.define(version: 2021_12_30_080114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "address_line1"
    t.string "address_line2"
    t.string "address_line3"
    t.string "landmark"
    t.integer "pincode"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "contact_details", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "phone_type"
    t.string "country_code"
    t.string "city_code"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_contact_details_on_user_id"
  end

  create_table "parcel_statuses", force: :cascade do |t|
    t.bigint "parcel_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parcel_id"], name: "index_parcel_statuses_on_parcel_id"
  end

  create_table "parcels", force: :cascade do |t|
    t.string "parcel_type"
    t.string "weight"
    t.text "content"
    t.boolean "is_delivered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tracking_number"
  end

  create_table "payment_details", force: :cascade do |t|
    t.bigint "parcel_id", null: false
    t.string "payment_mode"
    t.string "service_mode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parcel_id"], name: "index_payment_details_on_parcel_id"
  end

  create_table "user_parcels", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "parcel_id", null: false
    t.string "relation_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parcel_id"], name: "index_user_parcels_on_parcel_id"
    t.index ["user_id"], name: "index_user_parcels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "gender"
    t.string "id_proof_type"
    t.string "id_proof_number"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_type"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "contact_details", "users"
  add_foreign_key "parcel_statuses", "parcels"
  add_foreign_key "payment_details", "parcels"
  add_foreign_key "user_parcels", "parcels"
  add_foreign_key "user_parcels", "users"
end
