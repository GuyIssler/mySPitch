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

ActiveRecord::Schema.define(:version => 20141112154208) do

  create_table "admins", :force => true do |t|
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

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "candidate_feedbacks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "candidate_id"
    t.integer  "rating"
    t.string   "weaknesses"
    t.string   "strengths"
    t.string   "feedback"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "candidates", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "address"
    t.string   "age"
    t.string   "cv"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "employers", :force => true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "employers", ["email"], :name => "index_employers_on_email", :unique => true
  add_index "employers", ["reset_password_token"], :name => "index_employers_on_reset_password_token", :unique => true

  create_table "entries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.string   "state"
    t.string   "entry_hash"
    t.string   "video_url"
    t.integer  "rating"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "name"
    t.string   "email"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.string   "temp_video_file_name"
    t.string   "temp_video_content_type"
    t.integer  "temp_video_file_size"
    t.datetime "temp_video_updated_at"
    t.string   "temp_audio_file_name"
    t.string   "temp_audio_content_type"
    t.integer  "temp_audio_file_size"
    t.datetime "temp_audio_updated_at"
    t.text     "notes"
  end

  create_table "entry_responses", :force => true do |t|
    t.integer  "response_id"
    t.integer  "entry_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "entry_video_responses", :force => true do |t|
    t.integer  "video_response_id"
    t.integer  "entry_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "jobs", :force => true do |t|
    t.string   "state"
    t.string   "title"
    t.text     "description"
    t.string   "job_hash"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "recruiter_id"
    t.text     "email_content"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.text     "video_instructions"
  end

  create_table "questions", :force => true do |t|
    t.text     "content"
    t.boolean  "is_open_question"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "job_id"
    t.integer  "question_type"
    t.integer  "question_order"
    t.boolean  "mandatory",        :default => false
  end

  create_table "responses", :force => true do |t|
    t.text     "content"
    t.boolean  "is_true"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "question_id"
    t.boolean  "is_user_response"
    t.integer  "response_order"
  end

  create_table "users", :force => true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "video_questions", :force => true do |t|
    t.integer  "job_id"
    t.integer  "max_duration"
    t.integer  "max_takes"
    t.text     "content"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "video_responses", :force => true do |t|
    t.integer  "video_question_id"
    t.integer  "duration"
    t.integer  "take_num"
    t.string   "video_url"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
