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

ActiveRecord::Schema.define(:version => 20130707001143) do

  create_table "commits", :force => true do |t|
    t.datetime "commit_date"
    t.string   "committer_email"
    t.string   "committer_name"
    t.string   "html_url"
    t.string   "repository_id"
    t.string   "sha"
    t.datetime "author_date"
    t.string   "author_name"
    t.string   "author_email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "user_uid"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "grades", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "weights"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "participations", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "role"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "participations", ["project_id"], :name => "index_participations_on_project_id"
  add_index "participations", ["user_id"], :name => "index_participations_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.text     "description"
    t.integer  "grade_id"
    t.integer  "user_id"
    t.date     "started_at"
    t.date     "finished_at"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "projects", ["grade_id"], :name => "index_projects_on_grade_id"
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "records", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "category"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "value",        :default => 0
    t.integer  "weights"
    t.string   "user_name"
    t.string   "project_name"
    t.date     "commit_date"
  end

  add_index "records", ["project_id"], :name => "index_records_on_project_id"
  add_index "records", ["user_id"], :name => "index_records_on_user_id"

  create_table "repositories", :force => true do |t|
    t.string   "avatar_url"
    t.string   "description"
    t.string   "html_url"
    t.string   "name"
    t.string   "starred_url"
    t.string   "uid"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "project_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.boolean  "admin",                  :default => false
    t.integer  "score",                  :default => 0
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "provider"
    t.string   "uid"
    t.integer  "grade_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
