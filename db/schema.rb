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

ActiveRecord::Schema.define(version: 20170402212535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "answers", force: :cascade do |t|
    t.string   "slug"
    t.integer  "insurer_id"
    t.integer  "question_id"
    t.text     "content"
    t.boolean  "published"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "score"
  end

  add_index "answers", ["content"], name: "index_answers_on_content", using: :btree
  add_index "answers", ["insurer_id"], name: "index_answers_on_insurer_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "form_answers", force: :cascade do |t|
    t.integer "score"
    t.integer "form_question_id"
    t.integer "test_form_id"
  end

  add_index "form_answers", ["form_question_id"], name: "index_form_answers_on_form_question_id", using: :btree
  add_index "form_answers", ["test_form_id"], name: "index_form_answers_on_test_form_id", using: :btree

  create_table "form_questions", force: :cascade do |t|
    t.string  "name"
    t.text    "content"
    t.integer "type"
    t.string  "slug"
    t.boolean "published"
    t.integer "position"
  end

  create_table "form_questions_subject_categories", id: false, force: :cascade do |t|
    t.integer "form_question_id",    null: false
    t.integer "subject_category_id", null: false
  end

  add_index "form_questions_subject_categories", ["form_question_id", "subject_category_id"], name: "index_fq_id_on_sc_id", using: :btree
  add_index "form_questions_subject_categories", ["subject_category_id", "form_question_id"], name: "index_sc_id_on_fq_id", using: :btree

  create_table "form_questions_test_form_templates", id: false, force: :cascade do |t|
    t.integer "form_question_id",      null: false
    t.integer "test_form_template_id", null: false
  end

  add_index "form_questions_test_form_templates", ["form_question_id", "test_form_template_id"], name: "index_fq_id_on_tft_id", using: :btree
  add_index "form_questions_test_form_templates", ["test_form_template_id", "form_question_id"], name: "index_tft_id_on_fq_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "insurers", force: :cascade do |t|
    t.string   "slug"
    t.string   "name"
    t.text     "description"
    t.string   "logo"
    t.decimal  "price",            precision: 8, scale: 2
    t.decimal  "insured_amount",   precision: 8, scale: 2
    t.text     "extra_info"
    t.string   "affiliate_link"
    t.boolean  "published"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.text     "meta_page_title"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "slug"
    t.text     "content"
    t.boolean  "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["content"], name: "index_questions_on_content", using: :btree

  create_table "questions_subject_categories", id: false, force: :cascade do |t|
    t.integer "question_id",         null: false
    t.integer "subject_category_id", null: false
  end

  add_index "questions_subject_categories", ["question_id", "subject_category_id"], name: "index_q_id_on_sc_id", using: :btree
  add_index "questions_subject_categories", ["subject_category_id", "question_id"], name: "index_sc_id_on_q_id", using: :btree

  create_table "subject_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "test_form_templates", force: :cascade do |t|
    t.integer "type"
    t.string  "name"
    t.boolean "published"
    t.string  "slug"
  end

  create_table "test_forms", force: :cascade do |t|
    t.integer "type"
    t.string  "name"
    t.integer "test_form_template_id"
  end

  add_index "test_forms", ["test_form_template_id"], name: "index_test_forms_on_test_form_template_id", using: :btree

  add_foreign_key "answers", "insurers"
  add_foreign_key "answers", "questions"
  add_foreign_key "form_answers", "form_questions"
  add_foreign_key "form_answers", "test_forms"
  add_foreign_key "test_forms", "test_form_templates"
end
