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

ActiveRecord::Schema.define(:version => 20120701173059) do

  create_table "background_photos", :force => true do |t|
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "state"
    t.integer  "population"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "display_photo"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "tagline"
  end

  create_table "current_weathers", :force => true do |t|
    t.string   "condition"
    t.string   "temperature"
    t.string   "humidity"
    t.string   "wind_condition"
    t.string   "icon"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "city_id"
  end

  create_table "daily_deals", :force => true do |t|
    t.integer  "city_id"
    t.string   "image_url"
    t.string   "url"
    t.string   "description"
    t.string   "title"
    t.integer  "original_price"
    t.integer  "deal_price"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "foursquare_places", :force => true do |t|
    t.string   "icon"
    t.string   "venue_name"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "instagram_photos", :force => true do |t|
    t.string   "image"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "national_deals", :force => true do |t|
    t.string   "image_url"
    t.string   "url"
    t.string   "description"
    t.integer  "original_price"
    t.integer  "deal_price"
    t.string   "title"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "national_facts", :force => true do |t|
    t.integer  "city_id"
    t.string   "single_males"
    t.string   "single_females"
    t.string   "median_age"
    t.string   "average_commute_time"
    t.string   "home_value"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "people_facts", :force => true do |t|
    t.integer  "city_id"
    t.string   "single_males"
    t.string   "single_females"
    t.string   "median_age"
    t.string   "average_commute_time"
    t.string   "home_value"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "people_types", :force => true do |t|
    t.integer  "city_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "top_industries", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transportation_types", :force => true do |t|
    t.string   "description"
    t.integer  "city_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "twitter_posts", :force => true do |t|
    t.string   "tweeted_by"
    t.string   "tweet"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "walk_scores", :force => true do |t|
    t.integer  "city_id"
    t.integer  "score"
    t.string   "description"
    t.string   "logo_url"
    t.string   "ws_link"
    t.string   "last_updated"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
