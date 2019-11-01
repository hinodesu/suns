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

ActiveRecord::Schema.define(version: 20191101044910) do

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
    t.integer "student1"
    t.integer "student2"
    t.integer "student3"
    t.integer "student4"
    t.integer "student5"
    t.integer "student6"
    t.integer "student7"
    t.integer "student8"
    t.integer "student9"
    t.integer "student10"
    t.integer "student11"
    t.integer "student12"
    t.integer "student13"
    t.integer "student14"
    t.integer "student15"
    t.integer "student16"
    t.integer "student17"
    t.integer "student18"
    t.integer "student19"
    t.integer "student20"
    t.integer "student21"
    t.integer "student22"
    t.integer "student23"
    t.integer "student24"
    t.integer "student25"
    t.integer "student26"
    t.integer "student27"
    t.integer "student28"
    t.integer "student29"
    t.integer "student30"
    t.integer "student31"
    t.integer "student32"
    t.integer "student33"
    t.integer "student34"
    t.integer "student35"
    t.integer "student36"
    t.integer "student37"
    t.integer "student38"
    t.integer "student39"
    t.integer "student40"
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
