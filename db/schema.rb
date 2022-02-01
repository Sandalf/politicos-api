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

ActiveRecord::Schema.define(version: 2022_01_31_152720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "politician_records", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "description"
    t.integer "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "politician_id"
    t.index ["politician_id"], name: "index_politician_records_on_politician_id"
  end

  create_table "politicians", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "legislature"
    t.boolean "active"
    t.integer "party"
    t.date "birth_date"
    t.string "telephone"
    t.string "photo_url"
    t.string "legislative_experience"
    t.date "swearing_date"
    t.string "academic_preparation"
    t.string "location"
    t.string "last_degree_of_studies"
    t.string "district"
    t.string "city"
    t.boolean "relative_majority"
    t.integer "category"
    t.jsonb "social_links"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "state_id"
    t.index ["state_id"], name: "index_politicians_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "politician_records", "politicians"
  add_foreign_key "politicians", "states"
end
