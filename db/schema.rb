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

ActiveRecord::Schema.define(:version => 20140615111743) do

  create_table "blogs", :force => true do |t|
    t.string   "date"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.boolean  "comments"
    t.boolean  "public"
    t.string   "blog_photo"
  end

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "marks", :id => false, :force => true do |t|
    t.integer  "marker_id"
    t.string   "marker_type"
    t.integer  "markable_id"
    t.string   "markable_type"
    t.string   "mark",          :limit => 128
    t.datetime "created_at"
  end

  add_index "marks", ["markable_id", "markable_type", "mark"], :name => "index_marks_on_markable_id_and_markable_type_and_mark"
  add_index "marks", ["marker_id", "marker_type", "mark"], :name => "index_marks_on_marker_id_and_marker_type_and_mark"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.string   "date"
    t.string   "stayed"
    t.string   "tags"
    t.text     "body"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "blog_id"
    t.string   "photo_uploader"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "blog_photo"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "display_name"
    t.text     "bio"
    t.boolean  "private"
    t.string   "display"
    t.text     "public_bio"
    t.boolean  "public"
    t.string   "profile_image"
    t.string   "city"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "uid"
    t.string   "author"
    t.string   "duration"
    t.integer  "likes"
    t.integer  "dislikes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "post_id"
  end

end
