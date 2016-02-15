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

ActiveRecord::Schema.define(version: 20160215203507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "description"
    t.decimal  "posted_balance",     precision: 14, scale: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "person_id"
    t.string   "username"
    t.string   "bank_code"
    t.string   "plaid_access_token"
    t.decimal  "available_balance",  precision: 14, scale: 4
    t.decimal  "current_balance",    precision: 14, scale: 4
  end

  add_index "accounts", ["person_id"], name: "index_accounts_on_person_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "authentication_token"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "description"
    t.decimal  "amount",          precision: 14, scale: 4
    t.date     "authorized_date"
    t.date     "posted_date"
    t.integer  "account_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "transactions", ["account_id"], name: "index_transactions_on_account_id", using: :btree

  add_foreign_key "accounts", "people"
  add_foreign_key "transactions", "accounts"
end
