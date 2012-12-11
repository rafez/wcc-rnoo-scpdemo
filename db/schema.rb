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

ActiveRecord::Schema.define(:version => 20120628112135) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

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
