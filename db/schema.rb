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

ActiveRecord::Schema.define(version: 20171027153807) do

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.integer "number"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position_id"
    t.integer "uev_id"
    t.index ["position_id"], name: "index_candidates_on_position_id"
    t.index ["uev_id"], name: "index_candidates_on_uev_id"
  end

  create_table "elections", force: :cascade do |t|
    t.string "code"
    t.datetime "init"
    t.datetime "finish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "votes_id"
    t.index ["votes_id"], name: "index_elections_on_votes_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uevs", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uev_server"
  end

  create_table "voters", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.date "date_of_birth"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "uev_id"
    t.index ["uev_id"], name: "index_voters_on_uev_id"
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "uev_id"
    t.integer "voter_id"
    t.integer "candidate_id"
    t.integer "election_id"
    t.index ["candidate_id"], name: "index_votes_on_candidate_id"
    t.index ["election_id"], name: "index_votes_on_election_id"
    t.index ["uev_id"], name: "index_votes_on_uev_id"
    t.index ["voter_id"], name: "index_votes_on_voter_id"
  end

end
