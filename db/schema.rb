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

ActiveRecord::Schema.define(version: 20170221171656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "users",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "expert_trail", id: false, force: :cascade do |t|
    t.integer "expert_id", null: false
    t.integer "trail_id",  null: false
  end

  create_table "experts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text   "bio"
    t.string "avatar_url"
  end

  create_table "experts_resources", id: false, force: :cascade do |t|
    t.integer "expert_id"
    t.integer "resource_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "trail_id"
    t.integer  "user_id"
    t.boolean  "completed",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "section_id"
    t.string   "notes"
    t.string   "image_url"
  end

  create_table "resources_trails", id: false, force: :cascade do |t|
    t.integer "resource_id"
    t.integer "trail_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string   "title"
    t.integer  "trail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trails", force: :cascade do |t|
    t.string   "title"
    t.integer  "category_id"
    t.integer  "author_id"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "featured",    default: false
    t.integer  "votes_count", default: 0
    t.string   "image_url"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "avatar_url"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "trail_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
