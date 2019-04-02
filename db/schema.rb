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

ActiveRecord::Schema.define(version: 2019_04_02_031209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "tel_number"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "response_id"
    t.index ["response_id"], name: "index_questions_on_response_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "number"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "survey_id"
    t.index ["question_id"], name: "index_responses_on_question_id"
    t.index ["survey_id"], name: "index_responses_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name"
    t.bigint "response_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["response_id"], name: "index_surveys_on_response_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "questions", "responses"
  add_foreign_key "responses", "questions"
  add_foreign_key "responses", "surveys"
  add_foreign_key "surveys", "responses"
end
