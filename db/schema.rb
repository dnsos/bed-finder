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

ActiveRecord::Schema[7.0].define(version: 2023_01_15_170721) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gist"
  enable_extension "plpgsql"

  create_table "beds", force: :cascade do |t|
    t.bigint "facility_id", null: false
    t.string "permitted_genders", null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_beds_on_facility_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name", null: false
    t.string "district", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occupancies", force: :cascade do |t|
    t.bigint "bed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.tsrange "duration", null: false
    t.index ["bed_id", "duration"], name: "bed_id_duration_exclusive_range", using: :gist
    t.index ["bed_id"], name: "index_occupancies_on_bed_id"
  end

  add_foreign_key "beds", "facilities"
  add_foreign_key "occupancies", "beds"
end
