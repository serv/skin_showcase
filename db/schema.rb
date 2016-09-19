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

ActiveRecord::Schema.define(version: 20160918222908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: :cascade do |t|
    t.string   "name"
    t.string   "key"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "helpfuls", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.integer  "upvote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "skin_id"
    t.integer  "user_id"
    t.integer  "review_id"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "skin_id"
    t.string   "title"
    t.string   "long_form"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "skins", force: :cascade do |t|
    t.integer  "champion_id"
    t.integer  "skin_num"
    t.integer  "skin_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "chromas"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "ref_owned_skins"
    t.string   "ref_wanted_skins"
    t.string   "ref_ratings"
    t.string   "ref_comments"
    t.string   "ref_friends"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "remember_digest"
  end

end
