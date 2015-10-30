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

ActiveRecord::Schema.define(version: 20151029231732) do

  create_table "invitation_candidates", force: :cascade do |t|
    t.integer  "invitation_id"
    t.integer  "provision_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "invitation_candidates", ["invitation_id"], name: "index_invitation_candidates_on_invitation_id"
  add_index "invitation_candidates", ["provision_id"], name: "index_invitation_candidates_on_provision_id"

  create_table "invitations", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "note"
    t.integer  "provision_id"
    t.date     "ended"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "invitations", ["provision_id"], name: "index_invitations_on_provision_id"
  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id"

  create_table "provision_candidates", force: :cascade do |t|
    t.integer  "provision_id"
    t.integer  "invitation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "provision_candidates", ["invitation_id"], name: "index_provision_candidates_on_invitation_id"
  add_index "provision_candidates", ["provision_id"], name: "index_provision_candidates_on_provision_id"

  create_table "provisions", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "note"
    t.integer  "invitation_id"
    t.date     "ended"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "provisions", ["invitation_id"], name: "index_provisions_on_invitation_id"
  add_index "provisions", ["user_id"], name: "index_provisions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
