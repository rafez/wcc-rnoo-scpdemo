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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120607111510) do

  create_table "connections", :force => true do |t|
    t.string   "name"
    t.string   "servername"
    t.string   "ipaddress"
    t.text     "description"
    t.string   "privatekeypw"
    t.text     "privatekey"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "site_id"
  end

  create_table "migrations", :force => true do |t|
    t.string   "add_sitename_to_sites"
    t.string   "sitename"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "sites", :force => true do |t|
    t.string   "src_username"
    t.string   "password"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "src_sitename"
    t.string   "src_privatekey"
    t.string   "add_privatekeypw_to_sites"
    t.string   "src_privatekeypw"
    t.string   "remotefilepath"
    t.string   "src_filepath"
    t.integer  "frequency"
    t.string   "name"
    t.string   "src_description"
    t.boolean  "scheduleenabled"
    t.string   "dest_username"
    t.string   "dest_sitename"
    t.string   "dest_description"
    t.string   "dest_privatekeypw"
    t.string   "dest_privatekey"
    t.string   "dest_filepath"
    t.string   "task_description"
  end

end
