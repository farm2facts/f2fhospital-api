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

ActiveRecord::Schema.define(version: 2021_01_11_192239) do

  create_table "hospital_summaries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.string "street_addr"
    t.string "city"
    t.string "state"
    t.string "hospital_name"
    t.string "profile_year"
    t.string "profile_name"
    t.string "year_founded"
    t.boolean "part_of_HCO"
    t.string "HCO_name"
    t.boolean "other_healthcare_entities"
    t.string "name_other_entities"
    t.string "hospital_incorporated"
    t.string "member_of_associations"
    t.boolean "mission_statement_yn"
    t.string "mission_statement_loc"
    t.string "mission_statement"
    t.string "mission_last_updated"
    t.string "food_procurement_policy"
    t.string "food_menus"
    t.string "food_system_staff"
    t.string "info_requests"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_hospital_summaries_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "hospital_summaries", "users"
end
