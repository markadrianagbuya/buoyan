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

ActiveRecord::Schema.define(version: 20161115131547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "workshop_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["student_id"], name: "index_attendances_on_student_id", using: :btree
    t.index ["workshop_id"], name: "index_attendances_on_workshop_id", using: :btree
  end

  create_table "class_pass_transactions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "delta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_class_pass_transactions_on_student_id", using: :btree
  end

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "package_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_purchases_on_package_id", using: :btree
    t.index ["student_id"], name: "index_purchases_on_student_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "passes_remaining", default: 0
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers_workshops", id: false, force: :cascade do |t|
    t.integer "workshop_id", null: false
    t.integer "teacher_id",  null: false
    t.index ["teacher_id", "workshop_id"], name: "index_teachers_workshops_on_teacher_id_and_workshop_id", using: :btree
    t.index ["workshop_id", "teacher_id"], name: "index_teachers_workshops_on_workshop_id_and_teacher_id", using: :btree
  end

  create_table "workshops", force: :cascade do |t|
    t.date     "held_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "notes"
  end

  add_foreign_key "attendances", "students"
  add_foreign_key "attendances", "workshops"
  add_foreign_key "class_pass_transactions", "students"
  add_foreign_key "purchases", "packages"
  add_foreign_key "purchases", "students"
end
