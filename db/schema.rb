# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_14_061700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "town"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "acronym"
    t.string "shortname"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "type_id", null: false
    t.bigint "gstate_id", null: false
    t.string "round"
    t.date "date"
    t.time "time"
    t.bigint "hometeam_id"
    t.bigint "awayteam_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "scorehome"
    t.integer "scoreaway"
    t.bigint "season_id"
    t.index ["awayteam_id"], name: "index_games_on_awayteam_id"
    t.index ["gstate_id"], name: "index_games_on_gstate_id"
    t.index ["hometeam_id"], name: "index_games_on_hometeam_id"
    t.index ["season_id"], name: "index_games_on_season_id"
    t.index ["type_id"], name: "index_games_on_type_id"
  end

  create_table "gstates", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string "year"
    t.integer "stage"
    t.bigint "league_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_seasons_on_league_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "club_id", null: false
    t.string "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_teams_on_club_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "games", "gstates"
  add_foreign_key "games", "seasons"
  add_foreign_key "games", "types"
  add_foreign_key "seasons", "leagues"
  add_foreign_key "teams", "clubs"
end
