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

ActiveRecord::Schema.define(version: 2019_01_18_143442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communities", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "roomamount"
    t.integer "memberamount"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_communities_on_user_id"
  end

  create_table "communityusers", force: :cascade do |t|
    t.bigint "community_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_communityusers_on_community_id"
    t.index ["user_id"], name: "index_communityusers_on_user_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "community_id"
    t.string "name"
    t.date "birthday"
    t.string "status"
    t.string "image"
    t.boolean "assigned"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_members_on_community_id"
  end

  create_table "roommembers", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_roommembers_on_member_id"
    t.index ["room_id"], name: "index_roommembers_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "community_id"
    t.string "name"
    t.integer "occupancy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_rooms_on_community_id"
  end

  create_table "roomusers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_roomusers_on_room_id"
    t.index ["user_id"], name: "index_roomusers_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "community_id"
    t.integer "likes"
    t.integer "boos"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_todos_on_community_id"
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "status"
    t.string "image"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "communities", "users"
  add_foreign_key "communityusers", "communities"
  add_foreign_key "communityusers", "users"
  add_foreign_key "members", "communities"
  add_foreign_key "roommembers", "members"
  add_foreign_key "roommembers", "rooms"
  add_foreign_key "rooms", "communities"
  add_foreign_key "roomusers", "rooms"
  add_foreign_key "roomusers", "users"
  add_foreign_key "todos", "communities"
  add_foreign_key "todos", "users"
end
