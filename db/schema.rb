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

ActiveRecord::Schema.define(version: 20131014185607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: true do |t|
    t.float    "latitude",      default: 0.0,                         null: false
    t.float    "longitude",     default: 0.0,                         null: false
    t.string   "address",       default: "",                          null: false
    t.string   "zipcode",       default: "",                          null: false
    t.string   "boardnumber",   default: "",                          null: false
    t.string   "boardmodel",    default: "",                          null: false
    t.integer  "person_id",     default: 0,                           null: false
    t.integer  "channels",      default: 0,                           null: false
    t.string   "ip",            default: "",                          null: false
    t.string   "status",        default: "",                          null: false
    t.string   "googlemap_url", default: "",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",          default: "",                          null: false
    t.text     "description",   default: "",                          null: false
    t.string   "image",         default: "default_channel_image.png", null: false
  end

  create_table "boardshortmessages", force: true do |t|
    t.string   "channel1_on_in_seconds",   default: "0",  null: false
    t.string   "channel2_on_in_seconds",   default: "0",  null: false
    t.string   "channel3_on_in_seconds",   default: "0",  null: false
    t.string   "channel4_on_in_seconds",   default: "0",  null: false
    t.string   "channel5_on_in_seconds",   default: "0",  null: false
    t.string   "channel6_on_in_seconds",   default: "0",  null: false
    t.string   "channel7_on_in_seconds",   default: "0",  null: false
    t.string   "channel8_on_in_seconds",   default: "0",  null: false
    t.datetime "date"
    t.integer  "board_id",                 default: 0,    null: false
    t.integer  "randomaccesscode",         default: 8888, null: false
    t.integer  "scalediv32",               default: 8888, null: false
    t.integer  "year",                     default: 8888, null: false
    t.integer  "month",                    default: 8888, null: false
    t.integer  "day",                      default: 8888, null: false
    t.integer  "hour",                     default: 8888, null: false
    t.integer  "minute",                   default: 8888, null: false
    t.integer  "second",                   default: 8888, null: false
    t.integer  "channel1",                 default: 8888, null: false
    t.integer  "channel2",                 default: 8888, null: false
    t.integer  "channel3",                 default: 8888, null: false
    t.integer  "channel4",                 default: 8888, null: false
    t.integer  "channel5",                 default: 8888, null: false
    t.integer  "channel6",                 default: 8888, null: false
    t.integer  "channel7",                 default: 8888, null: false
    t.integer  "channel8",                 default: 8888, null: false
    t.integer  "sendstatus",               default: 8888, null: false
    t.integer  "echo",                     default: 8888, null: false
    t.integer  "willsend",                 default: 8888, null: false
    t.integer  "checksum",                 default: 8888, null: false
    t.string   "concatinated_board_ascii", default: "",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "channels", force: true do |t|
    t.integer  "board_id"
    t.integer  "number"
    t.string   "name"
    t.string   "channel_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.integer  "role_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "triggers", force: true do |t|
    t.integer  "channel_id",     default: 0,    null: false
    t.integer  "weekday_id",     default: 0,    null: false
    t.time     "on_at"
    t.integer  "duration",       default: 0,    null: false
    t.integer  "weekday_int"
    t.string   "weekday_string", default: "",   null: false
    t.boolean  "enabled",        default: true, null: false
    t.string   "short_status",   default: "",   null: false
    t.text     "details",        default: "",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id",              default: 0,  null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "waterallboards", force: true do |t|
    t.float    "latitude",      default: 0.0, null: false
    t.float    "longitude",     default: 0.0, null: false
    t.string   "address",       default: "",  null: false
    t.string   "zipcode",       default: "",  null: false
    t.string   "boardnumber",   default: "",  null: false
    t.string   "boardmodel",    default: "",  null: false
    t.integer  "person_id",     default: 0,   null: false
    t.integer  "channels",      default: 0,   null: false
    t.string   "ip",            default: "",  null: false
    t.string   "status",        default: "",  null: false
    t.string   "googlemap_url", default: "",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "waterings", force: true do |t|
    t.datetime "time"
    t.integer  "version"
    t.integer  "channel"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
