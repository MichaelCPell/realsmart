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

ActiveRecord::Schema.define(version: 20151020203334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "precincts", force: :cascade do |t|
    t.string   "county_name"
    t.string   "county_id"
    t.string   "official_id"
    t.string   "official_description"
    t.geometry "geom",                 limit: {:srid=>4326, :type=>"multi_polygon"}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "single_family_homes", force: :cascade do |t|
    t.string   "owner_id"
    t.string   "owner_first_name"
    t.string   "owner_last_name"
    t.string   "owner_name"
    t.string   "owner_address1"
    t.string   "owner_address2"
    t.string   "county_name"
    t.integer  "property_value"
    t.string   "property_address"
    t.geometry "geom",             limit: {:srid=>4326, :type=>"multi_polygon"}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
