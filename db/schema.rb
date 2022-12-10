# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_10_013452) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "request_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_answers_on_request_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "promotion_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_comments_on_promotion_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_contents_on_title", unique: true
  end

  create_table "embeds", force: :cascade do |t|
    t.string "identifier"
    t.string "embeddable_type"
    t.bigint "embeddable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "embeddable_media", default: 0, null: false
    t.index ["embeddable_type", "embeddable_id"], name: "index_embeds_on_embeddable"
  end

  create_table "fans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "favorite_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 0, null: false
    t.index ["favorite_id"], name: "index_fans_on_favorite_id"
    t.index ["user_id"], name: "index_fans_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.string "name", null: false
    t.integer "existence", null: false
    t.integer "decade", null: false
    t.integer "gender", null: false
    t.bigint "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["content_id"], name: "index_favorites_on_content_id"
    t.index ["group_id"], name: "index_favorites_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_groups_on_name", unique: true
  end

  create_table "promotion_bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "promotion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_promotion_bookmarks_on_promotion_id"
    t.index ["user_id", "promotion_id"], name: "index_promotion_bookmarks_on_user_id_and_promotion_id", unique: true
    t.index ["user_id"], name: "index_promotion_bookmarks_on_user_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.integer "existence"
    t.integer "decade"
    t.integer "gender"
    t.bigint "content_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.index ["content_id"], name: "index_promotions_on_content_id"
    t.index ["group_id"], name: "index_promotions_on_group_id"
    t.index ["user_id"], name: "index_promotions_on_user_id"
  end

  create_table "request_bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "request_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_request_bookmarks_on_request_id"
    t.index ["user_id", "request_id"], name: "index_request_bookmarks_on_user_id_and_request_id", unique: true
    t.index ["user_id"], name: "index_request_bookmarks_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "description"
    t.integer "existence"
    t.integer "decade"
    t.integer "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "avatar"
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "answers", "requests"
  add_foreign_key "answers", "users"
  add_foreign_key "comments", "promotions"
  add_foreign_key "comments", "users"
  add_foreign_key "fans", "favorites"
  add_foreign_key "fans", "users"
  add_foreign_key "favorites", "contents"
  add_foreign_key "favorites", "groups"
  add_foreign_key "promotion_bookmarks", "promotions"
  add_foreign_key "promotion_bookmarks", "users"
  add_foreign_key "promotions", "contents"
  add_foreign_key "promotions", "groups"
  add_foreign_key "promotions", "users"
  add_foreign_key "request_bookmarks", "requests"
  add_foreign_key "request_bookmarks", "users"
  add_foreign_key "requests", "users"
end
