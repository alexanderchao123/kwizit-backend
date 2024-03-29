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

ActiveRecord::Schema.define(version: 2019_02_28_041505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admissions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "round_id"
    t.integer "score", default: 0
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_admissions_on_round_id"
    t.index ["user_id"], name: "index_admissions_on_user_id"
  end

  create_table "choices", force: :cascade do |t|
    t.bigint "question_id"
    t.string "answer"
    t.boolean "correct", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "decisions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "round_question_id"
    t.bigint "choice_id"
    t.boolean "correct", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_decisions_on_choice_id"
    t.index ["round_question_id"], name: "index_decisions_on_round_question_id"
    t.index ["user_id"], name: "index_decisions_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "quiz_id"
    t.string "title"
    t.string "difficulty"
    t.integer "points", default: 100
    t.integer "time", default: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "title"
    t.text "description"
    t.boolean "public", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_quizzes_on_creator_id"
  end

  create_table "round_questions", force: :cascade do |t|
    t.bigint "round_id"
    t.bigint "question_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_round_questions_on_question_id"
    t.index ["round_id"], name: "index_round_questions_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "host_id"
    t.bigint "quiz_id"
    t.string "pin"
    t.boolean "complete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_rounds_on_host_id"
    t.index ["quiz_id"], name: "index_rounds_on_quiz_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
