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

ActiveRecord::Schema.define(version: 20180514232005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expeditions", force: :cascade do |t|
    t.string "name", null: false
    t.string "target", null: false
    t.string "plan", default: ""
    t.datetime "start", null: false
    t.datetime "finish", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.integer "cover_file_size"
    t.datetime "cover_updated_at"
    t.index ["name"], name: "index_expeditions_on_name"
  end

  create_table "expeditions_positions", id: false, force: :cascade do |t|
    t.bigint "expedition_id", null: false
    t.bigint "position_id", null: false
    t.integer "count"
  end

  create_table "expeditions_regions", id: false, force: :cascade do |t|
    t.bigint "expedition_id", null: false
    t.bigint "region_id", null: false
    t.integer "distance"
  end

  create_table "expeditions_teleshows", id: false, force: :cascade do |t|
    t.bigint "expedition_id", null: false
    t.bigint "teleshow_id", null: false
  end

  create_table "forms", force: :cascade do |t|
    t.integer "user_id"
    t.integer "expedition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position"
    t.index ["expedition_id"], name: "index_forms_on_expedition_id"
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name", null: false
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name", null: false
    t.string "space_type"
    t.string "description"
    t.integer "danger_level"
    t.string "space"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "teleshows", force: :cascade do |t|
    t.string "chanel"
    t.string "name"
    t.string "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "last_name"
    t.string "department"
    t.string "description"
    t.string "role", default: "user", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
