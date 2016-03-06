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

ActiveRecord::Schema.define(version: 20160226171622) do

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
    t.string   "plaid_id"
  end

  add_index "accounts", ["person_id"], name: "index_accounts_on_person_id", using: :btree
  add_index "accounts", ["plaid_access_token"], name: "index_accounts_on_plaid_access_token", using: :btree
  add_index "accounts", ["plaid_id"], name: "index_accounts_on_plaid_id", unique: true, using: :btree

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.string   "institution_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "authentication_token"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "description"
    t.decimal  "amount",           precision: 14, scale: 4
    t.date     "authorized_date"
    t.date     "posted_date"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "plaid_account_id"
    t.string   "plaid_id"
  end

  add_index "transactions", ["plaid_account_id"], name: "index_transactions_on_plaid_account_id", using: :btree
  add_index "transactions", ["plaid_id"], name: "index_transactions_on_plaid_id", unique: true, using: :btree

  add_foreign_key "accounts", "people"
end
