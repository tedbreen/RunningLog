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

ActiveRecord::Schema.define(version: 20140529010602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "runs", force: true do |t|
    t.integer  "user_id",     null: false
    t.integer  "run_type",    null: false
    t.string   "city",        null: false
    t.string   "state",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "duration"
    t.string   "title",       null: false
    t.float    "distance",    null: false
    t.text     "description", null: false
    t.datetime "start_date",  null: false
  end

  add_index "runs", ["city"], name: "index_runs_on_city", using: :btree
  add_index "runs", ["distance"], name: "index_runs_on_distance", using: :btree
  add_index "runs", ["duration"], name: "index_runs_on_duration", using: :btree
  add_index "runs", ["run_type"], name: "index_runs_on_run_type", using: :btree
  add_index "runs", ["state"], name: "index_runs_on_state", using: :btree
  add_index "runs", ["user_id"], name: "index_runs_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_token",   null: false
    t.string   "fname",           null: false
    t.string   "lname",           null: false
    t.string   "state",           null: false
    t.string   "city",            null: false
    t.integer  "gender",          null: false
    t.string   "avatar",          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
