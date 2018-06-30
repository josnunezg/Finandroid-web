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

ActiveRecord::Schema.define(version: 20180627004833) do

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "balance",    limit: 4,   default: 0
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "bank_accounts", ["user_id"], name: "index_bank_accounts_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "default",                default: false
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree

  create_table "expenses", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.integer  "amount",          limit: 4,     default: 0
    t.integer  "bank_account_id", limit: 4
    t.integer  "category_id",     limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "expenses", ["bank_account_id"], name: "index_expenses_on_bank_account_id", using: :btree
  add_index "expenses", ["category_id"], name: "index_expenses_on_category_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.integer  "amount",          limit: 4,     default: 0
    t.integer  "bank_account_id", limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "salaries", ["bank_account_id"], name: "index_salaries_on_bank_account_id", using: :btree

  create_table "summaries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "trackable",  limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "summaries", ["user_id"], name: "index_summaries_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "username",               limit: 255, default: "", null: false
    t.integer  "group_id",               limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bank_accounts", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "expenses", "bank_accounts"
  add_foreign_key "expenses", "categories"
  add_foreign_key "salaries", "bank_accounts"
  add_foreign_key "summaries", "users"
  add_foreign_key "users", "groups"
end
