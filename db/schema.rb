# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151127153208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "checks", ["place_id"], name: "index_checks_on_place_id", using: :btree
  add_index "checks", ["user_id", "place_id"], name: "index_checks_on_user_id_and_place_id", unique: true, using: :btree
  add_index "checks", ["value"], name: "index_checks_on_value", using: :btree

  create_table "counters", force: :cascade do |t|
    t.integer  "users"
    t.integer  "checks"
    t.integer  "places"
    t.integer  "checked_places"
    t.float    "progress"
    t.integer  "ok_checks"
    t.integer  "not_checks"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "ok_places"
    t.integer  "not_places"
  end

  create_table "places", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "code"
    t.boolean  "telegram",   default: true
  end

  add_index "places", ["code"], name: "index_places_on_code", unique: true, using: :btree
  add_index "places", ["telegram"], name: "index_places_on_telegram", using: :btree
  add_index "places", ["url"], name: "index_places_on_url", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
    t.string   "name"
    t.string   "email"
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree

  add_foreign_key "checks", "places"
  add_foreign_key "checks", "users"
end
