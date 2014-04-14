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

ActiveRecord::Schema.define(version: 20140414212134) do

  create_table "budgets", force: true do |t|
    t.integer  "income"
    t.integer  "healthcare"
    t.string   "state"
    t.integer  "income_after_taxes"
    t.integer  "housing"
    t.integer  "cable_internet"
    t.integer  "utilities"
    t.integer  "laundry"
    t.integer  "commute"
    t.integer  "food"
    t.integer  "debt_service"
    t.integer  "investing"
    t.integer  "emergency"
    t.integer  "disposable_income"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.boolean  "guest"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
