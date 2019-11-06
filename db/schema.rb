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

ActiveRecord::Schema.define(version: 20191101053835) do

  create_table "annual_events", force: :cascade do |t|
    t.string "filename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "filename"
    t.integer "category"
    t.date "d_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.string "subject"
    t.string "title"
    t.date "deadline"
    t.string "filename"
    t.integer "grade"
    t.integer "class_room"
    t.integer "student1", default: 0
    t.integer "student2", default: 0
    t.integer "student3", default: 0
    t.integer "student4", default: 0
    t.integer "student5", default: 0
    t.integer "student6", default: 0
    t.integer "student7", default: 0
    t.integer "student8", default: 0
    t.integer "student9", default: 0
    t.integer "student10", default: 0
    t.integer "student11", default: 0
    t.integer "student12", default: 0
    t.integer "student13", default: 0
    t.integer "student14", default: 0
    t.integer "student15", default: 0
    t.integer "student16", default: 0
    t.integer "student17", default: 0
    t.integer "student18", default: 0
    t.integer "student19", default: 0
    t.integer "student20", default: 0
    t.integer "student21", default: 0
    t.integer "student22", default: 0
    t.integer "student23", default: 0
    t.integer "student24", default: 0
    t.integer "student25", default: 0
    t.integer "student26", default: 0
    t.integer "student27", default: 0
    t.integer "student28", default: 0
    t.integer "student29", default: 0
    t.integer "student30", default: 0
    t.integer "student31", default: 0
    t.integer "student32", default: 0
    t.integer "student33", default: 0
    t.integer "student34", default: 0
    t.integer "student35", default: 0
    t.integer "student36", default: 0
    t.integer "student37", default: 0
    t.integer "student38", default: 0
    t.integer "student39", default: 0
    t.integer "student40", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "number"
    t.integer "grade"
    t.integer "class_room"
    t.string "name"
    t.string "kana"
    t.string "gender"
    t.string "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
