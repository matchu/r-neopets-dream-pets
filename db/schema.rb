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

ActiveRecord::Schema.define(version: 20150612162039) do

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "colors", ["name"], name: "index_colors_on_name"

  create_table "conversion_states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "conversion_states", ["name"], name: "index_conversion_states_on_name"

  create_table "name_qualities", force: :cascade do |t|
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "pet_requests", force: :cascade do |t|
    t.integer  "species_id"
    t.integer  "color_id"
    t.integer  "conversion_state_id"
    t.integer  "minimum_name_quality_id"
    t.text     "info"
    t.integer  "creator_id"
    t.boolean  "requires_clothes"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "pet_requests", ["created_at"], name: "index_pet_requests_on_created_at"

  create_table "species", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "species", ["name"], name: "index_species_on_name"

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.text     "auth_hash"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "admin",      default: false, null: false
    t.string   "name"
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid"

end
