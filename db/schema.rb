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

ActiveRecord::Schema.define(version: 20161112094031) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "workshop_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["student_id"], name: "index_attendances_on_student_id"
    t.index ["workshop_id"], name: "index_attendances_on_workshop_id"
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
    t.index ["package_id"], name: "index_purchases_on_package_id"
    t.index ["student_id"], name: "index_purchases_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers_workshops", id: false, force: :cascade do |t|
    t.integer "workshop_id", null: false
    t.integer "teacher_id",  null: false
    t.index ["teacher_id", "workshop_id"], name: "index_teachers_workshops_on_teacher_id_and_workshop_id"
    t.index ["workshop_id", "teacher_id"], name: "index_teachers_workshops_on_workshop_id_and_teacher_id"
  end

  create_table "workshops", force: :cascade do |t|
    t.date     "held_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "notes"
  end

end
