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

ActiveRecord::Schema.define(version: 2018_10_19_050726) do

  create_table "activities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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

  create_table "areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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

  create_table "forces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "in_objectives", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "objective_id"
    t.bigint "strategy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["objective_id"], name: "index_in_objectives_on_objective_id"
    t.index ["strategy_id"], name: "index_in_objectives_on_strategy_id"
  end

  create_table "information", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "mission"
    t.text "vision"
    t.string "macroproceso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "objectives", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "slug"
    t.text "content"
    t.bigint "perspective_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perspective_id"], name: "index_objectives_on_perspective_id"
  end

  create_table "opportunities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "slug"
    t.text "content"
    t.bigint "factor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factor_id"], name: "index_opportunities_on_factor_id"
  end

  create_table "perspectives", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "processings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strategies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "foda"
    t.string "tipo"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strengths", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "slug"
    t.text "content"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_strengths_on_activity_id"
  end

  create_table "sub_processes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.bigint "processing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["processing_id"], name: "index_sub_processes_on_processing_id"
  end

  create_table "threats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "slug"
    t.text "content"
    t.bigint "factor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factor_id"], name: "index_threats_on_factor_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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

  create_table "values", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weaknesses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "slug"
    t.text "content"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_weaknesses_on_activity_id"
  end

  add_foreign_key "activities", "areas"
  add_foreign_key "factors", "forces"
  add_foreign_key "in_objectives", "objectives"
  add_foreign_key "in_objectives", "strategies"
  add_foreign_key "objectives", "perspectives"
  add_foreign_key "opportunities", "factors"
  add_foreign_key "strengths", "activities"
  add_foreign_key "sub_processes", "processings"
  add_foreign_key "threats", "factors"
  add_foreign_key "weaknesses", "activities"
end
