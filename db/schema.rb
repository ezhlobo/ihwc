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

ActiveRecord::Schema.define(version: 20140215111517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.datetime "date"
    t.string   "place"
    t.boolean  "finished"
  end

  create_table "games_teams", force: true do |t|
    t.integer "game_id"
    t.integer "team_id"
  end

  create_table "groups", force: true do |t|
    t.string "name"
  end

  create_table "results", force: true do |t|
    t.integer "game_id"
    t.integer "team_one"
    t.integer "team_two"
    t.integer "team_one_score"
    t.integer "team_two_score"
    t.integer "winner_id"
  end

  create_table "stats", force: true do |t|
    t.integer "team_id"
    t.integer "gp"
    t.integer "w"
    t.integer "otw"
    t.integer "otl"
    t.integer "l"
    t.integer "gf"
    t.integer "ga"
    t.integer "dif"
    t.integer "pts"
    t.integer "ranke"
  end

  create_table "teams", force: true do |t|
    t.string  "name"
    t.integer "group_id"
  end

end
