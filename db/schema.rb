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

ActiveRecord::Schema.define(version: 20151008020132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.datetime "gametime_start"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "week_game_id"
  end

  create_table "picks", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.integer "picked_team_id"
  end

  create_table "records", force: :cascade do |t|
    t.integer "user_id"
    t.integer "wins"
    t.integer "losses"
  end

  create_table "results", force: :cascade do |t|
    t.integer "game_id"
    t.integer "winner"
    t.integer "loser"
    t.boolean "tie",     default: false
  end

  create_table "teams", force: :cascade do |t|
    t.string  "name",      null: false
    t.integer "wins"
    t.integer "losses"
    t.string  "city"
    t.string  "team_logo"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
    t.string   "first_name"
    t.string   "avatar"
    t.text     "trash_talk"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "week_records", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "week_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weeks", force: :cascade do |t|
    t.integer  "week_number"
    t.datetime "week_start"
    t.datetime "week_end"
  end

end
