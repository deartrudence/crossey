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

ActiveRecord::Schema.define(version: 20161017193827) do

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "individual_review_id"
    t.text     "answer"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "answers", ["individual_review_id"], name: "index_answers_on_individual_review_id"
  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "individual_reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "review_id"
    t.date     "date"
    t.integer  "employee_id"
    t.integer  "reviewer_id"
    t.string   "employee_job_type"
    t.string   "employee_job_title"
    t.integer  "employee_job_level"
  end

  add_index "individual_reviews", ["review_id"], name: "index_individual_reviews_on_review_id"
  add_index "individual_reviews", ["user_id"], name: "index_individual_reviews_on_user_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "job_title"
    t.string   "job_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "job_level"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "question_job_levels", force: :cascade do |t|
    t.integer  "job_level"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "question_job_levels", ["question_id"], name: "index_question_job_levels_on_question_id"

  create_table "questions", force: :cascade do |t|
    t.string   "subsection"
    t.string   "job_type"
    t.string   "question_text"
    t.string   "question_type"
    t.integer  "section_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "questions", ["section_id"], name: "index_questions_on_section_id"

  create_table "reviews", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "section_answers", force: :cascade do |t|
    t.integer  "section_id"
    t.integer  "individual_review_id"
    t.text     "employee_comment"
    t.text     "reviewer_comment"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "section_answers", ["individual_review_id"], name: "index_section_answers_on_individual_review_id"
  add_index "section_answers", ["section_id"], name: "index_section_answers_on_section_id"

  create_table "sections", force: :cascade do |t|
    t.integer  "review_id"
    t.string   "title"
    t.string   "portion"
    t.text     "employee_comment"
    t.text     "reviewer_comment"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "sections", ["review_id"], name: "index_sections_on_review_id"

  create_table "signatures", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.boolean  "signed"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "individual_review_id"
    t.string   "signature_type"
  end

  add_index "signatures", ["individual_review_id"], name: "index_signatures_on_individual_review_id"

  create_table "user_roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
