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

ActiveRecord::Schema.define(version: 20171119211130) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.datetime "publish_date"
    t.boolean  "published"
    t.text     "content"
    t.string   "thumb_image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.datetime "publish_date"
    t.string   "author"
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "author"
    t.text     "content"
    t.string   "avatar_image"
    t.integer  "rating"
    t.integer  "blog_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id"
  end

  create_table "development", id: false, force: :cascade do |t|
    t.text "C1"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "quantity_on_hand"
    t.decimal  "low_price_range"
    t.decimal  "high_price_range"
    t.decimal  "cost_to_company"
    t.decimal  "shipping_weight"
    t.string   "thumb_image"
    t.string   "full_image"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "name"
    t.text     "review_text"
    t.integer  "rating"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "name"
    t.boolean  "newsletter",             default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end