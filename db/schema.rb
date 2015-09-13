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

ActiveRecord::Schema.define(version: 20150401002146) do

  create_table "proposals", force: :cascade do |t|
    t.string   "speaker_name",                   null: false
    t.string   "title",                          null: false
    t.text     "description",                    null: false
    t.string   "email",                          null: false
    t.string   "phone"
    t.text     "bio",                            null: false
    t.string   "website"
    t.string   "hash_code",                      null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "selected",       default: false, null: false
    t.integer  "position",       default: 0,     null: false
    t.string   "filepicker_url"
    t.boolean  "archived",       default: false, null: false
  end

  add_index "proposals", ["created_at"], name: "index_proposals_on_created_at"
  add_index "proposals", ["hash_code"], name: "index_proposals_on_hash_code", unique: true
  add_index "proposals", ["position"], name: "index_proposals_on_position"

  create_table "rails_admin_histories", force: :cascade do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories"

end
