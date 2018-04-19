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

ActiveRecord::Schema.define(version: 20180419125638) do

  create_table "families", force: :cascade do |t|
    t.string "family_name"
    t.string "image_url"
    t.string "password_digest"
    t.string "family_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "memories", force: :cascade do |t|
    t.string "image_url"
    t.string "description"
    t.date "date"
    t.string "title"
    t.integer "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "bio"
    t.date "dob"
    t.date "dod"
    t.string "image_url"
    t.boolean "is_account", default: false
    t.string "username"
    t.string "password_digest"
    t.integer "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "person_id"
    t.integer "memory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
