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

ActiveRecord::Schema.define(version: 2019_11_27_005612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_words", force: :cascade do |t|
    t.bigint "vocabulary_id"
    t.bigint "user_id"
    t.boolean "selected", null: false
    t.index ["user_id"], name: "index_favorite_words_on_user_id"
    t.index ["vocabulary_id"], name: "index_favorite_words_on_vocabulary_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "move_lists", force: :cascade do |t|
    t.bigint "characters_id"
    t.string "name", null: false
    t.string "input", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["characters_id"], name: "index_move_lists_on_characters_id"
  end

  create_table "moves", force: :cascade do |t|
    t.bigint "variation_id"
    t.string "name", null: false
    t.string "input", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["variation_id"], name: "index_moves_on_variation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variations", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "character_id"
    t.index ["character_id"], name: "index_variations_on_character_id"
    t.index ["game_id"], name: "index_variations_on_game_id"
  end

  create_table "vocabularies", force: :cascade do |t|
    t.string "word", null: false
    t.string "definition", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
