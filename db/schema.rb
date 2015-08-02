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

ActiveRecord::Schema.define(version: 20150802102153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "designs", force: true do |t|
    t.integer  "upload_id"
    t.text     "meta_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "designs", ["upload_id"], name: "index_designs_on_upload_id", using: :btree

  create_table "images", force: true do |t|
    t.integer  "design_id"
    t.string   "onex_file_name"
    t.string   "onex_content_type"
    t.integer  "onex_file_size"
    t.datetime "onex_updated_at"
    t.string   "twox_file_name"
    t.string   "twox_content_type"
    t.integer  "twox_file_size"
    t.datetime "twox_updated_at"
    t.string   "threex_file_name"
    t.string   "threex_content_type"
    t.integer  "threex_file_size"
    t.datetime "threex_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["design_id"], name: "index_images_on_design_id", using: :btree

  create_table "uploads", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "psd_file_name"
    t.string   "psd_content_type"
    t.integer  "psd_file_size"
    t.datetime "psd_updated_at"
    t.string   "psd_image_file_name"
    t.string   "psd_image_content_type"
    t.integer  "psd_image_file_size"
    t.datetime "psd_image_updated_at"
    t.integer  "status",                 default: 0
  end

  add_index "uploads", ["user_id"], name: "index_uploads_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
