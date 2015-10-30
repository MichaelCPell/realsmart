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

ActiveRecord::Schema.define(version: 20151030120710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "postgis_topology"
  enable_extension "fuzzystrmatch"
  enable_extension "hstore"

  create_table "constitutes", force: :cascade do |t|
    t.integer  "voter_id"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "constitutes", ["district_id"], name: "index_demog.constitutes_on_district_id", using: :btree
  add_index "constitutes", ["voter_id"], name: "index_demog.constitutes_on_voter_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "county_name"
    t.string   "office"
    t.string   "number"
    t.float    "shape_len"
    t.float    "shape_area"
    t.geometry "geom",        limit: {:srid=>4326, :type=>"multi_polygon"}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "state"
    t.string   "county_name"
    t.string   "city_name"
    t.string   "name"
    t.string   "region_id"
    t.geometry "geom",        limit: {:srid=>4326, :type=>"multi_polygon"}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "precincts", force: :cascade do |t|
    t.string   "county_name"
    t.string   "county_id"
    t.string   "official_id"
    t.string   "official_description"
    t.geometry "geom",                 limit: {:srid=>4326, :type=>"multi_polygon"}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: :cascade do |t|
    t.string   "name"
    t.integer  "district_id"
    t.json     "data",        default: {}
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "reports", ["district_id"], name: "index_demog.reports_on_district_id", using: :btree

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

  create_table "voters", force: :cascade do |t|
    t.string   "county_id"
    t.string   "county_desc"
    t.string   "voter_reg_num"
    t.string   "status_cd"
    t.string   "voter_status_desc"
    t.string   "reason_cd"
    t.string   "voter_status_reason_desc"
    t.string   "absent_ind"
    t.string   "name_prefx_cd"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "name_suffix_lbl"
    t.string   "res_street_address"
    t.string   "res_city_desc"
    t.string   "state_cd"
    t.string   "zip_code"
    t.string   "mail_addr1"
    t.string   "mail_addr2"
    t.string   "mail_addr3"
    t.string   "mail_addr4"
    t.string   "mail_city"
    t.string   "mail_state"
    t.string   "mail_zipcode"
    t.string   "full_phone_number"
    t.string   "race_code"
    t.string   "ethnic_code"
    t.string   "party_cd"
    t.string   "gender_code"
    t.string   "birth_age"
    t.string   "birth_state"
    t.string   "drivers_lic"
    t.string   "registr_dt"
    t.string   "precinct_abbrv"
    t.string   "precinct_desc"
    t.string   "municipality_abbrv"
    t.string   "municipality_desc"
    t.string   "ward_abbrv"
    t.string   "ward_desc"
    t.string   "cong_dist_abbrv"
    t.string   "super_court_abbrv"
    t.string   "judic_dist_abbrv"
    t.string   "nc_senate_abbrv"
    t.string   "nc_house_abbrv"
    t.string   "county_commiss_abbrv"
    t.string   "county_commiss_desc"
    t.string   "township_abbrv"
    t.string   "township_desc"
    t.string   "school_dist_abbrv"
    t.string   "school_dist_desc"
    t.string   "fire_dist_abbrv"
    t.string   "fire_dist_desc"
    t.string   "water_dist_abbrv"
    t.string   "water_dist_desc"
    t.string   "sewer_dist_abbrv"
    t.string   "sewer_dist_desc"
    t.string   "sanit_dist_abbrv"
    t.string   "sanit_dist_desc"
    t.string   "rescue_dist_abbrv"
    t.string   "rescue_dist_desc"
    t.string   "munic_dist_abbrv"
    t.string   "munic_dist_desc"
    t.string   "dist_1_abbrv"
    t.string   "dist_1_desc"
    t.string   "dist_2_abbrv"
    t.string   "dist_2_desc"
    t.string   "confidential_ind"
    t.string   "age"
    t.string   "ncid"
    t.string   "vtd_abbrv"
    t.string   "vtd_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.geometry "location",                 limit: {:srid=>4326, :type=>"geometry"}
    t.integer  "geocode_attempt",                                                   default: 0
  end

  add_foreign_key "constitutes", "districts"
  add_foreign_key "constitutes", "voters"
  add_foreign_key "reports", "districts"
end
