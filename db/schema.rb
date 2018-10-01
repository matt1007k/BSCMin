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

ActiveRecord::Schema.define(version: 2018_09_27_163943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.text "name"
    t.integer "alta", default: 0
    t.integer "media", default: 0
    t.integer "baja", default: 0
    t.integer "muy_bueno", default: 0
    t.integer "bueno", default: 0
    t.integer "deficiente", default: 0
    t.integer "muy_deficiente", default: 0
    t.integer "valor", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "area_id"
    t.index ["area_id"], name: "index_activities_on_area_id"
  end

  create_table "areas", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factors", force: :cascade do |t|
    t.string "title"
    t.integer "alta", default: 0
    t.integer "media", default: 0
    t.integer "baja", default: 0
    t.integer "muy_positivo", default: 0
    t.integer "positivo", default: 0
    t.integer "negativo", default: 0
    t.integer "muy_negativo", default: 0
    t.integer "valor", default: 0
    t.bigint "force_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["force_id"], name: "index_factors_on_force_id"
  end

  create_table "forces", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "missions", force: :cascade do |t|
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "values", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visions", force: :cascade do |t|
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "areas"
  add_foreign_key "factors", "forces"
end
