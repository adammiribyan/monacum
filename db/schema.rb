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

ActiveRecord::Schema.define(:version => 20110401160240) do

  create_table "clients", :force => true do |t|
    t.string   "personal_last_name"
    t.string   "personal_first_name"
    t.string   "personal_surname"
    t.date     "personal_birth_date"
    t.string   "personal_birth_place"
    t.string   "personal_relationship_status"
    t.string   "personal_education"
    t.string   "personal_inn"
    t.integer  "personal_izhd_count"
    t.string   "doc_seria"
    t.string   "doc_number"
    t.date     "doc_date"
    t.string   "doc_author"
    t.string   "reg_region"
    t.string   "reg_city"
    t.string   "reg_street"
    t.string   "reg_house"
    t.string   "reg_building"
    t.string   "reg_flat"
    t.string   "reg_phone"
    t.string   "fact_region"
    t.string   "fact_city"
    t.string   "fact_street"
    t.string   "fact_house"
    t.string   "fact_building"
    t.string   "fact_flat"
    t.string   "fact_period"
    t.string   "fact_st_phone"
    t.string   "fact_mob_phone"
    t.string   "fisrt_cont_per_last_name"
    t.string   "fisrt_cont_per_first_name"
    t.string   "fisrt_cont_per_surname"
    t.string   "fisrt_cont_per_relatives_level"
    t.string   "fisrt_cont_per_st_phone"
    t.string   "fisrt_cont_per_mob_phone"
    t.string   "second_cont_per_last_name"
    t.string   "second_cont_per_surname"
    t.string   "second_cont_per_relatives_level"
    t.string   "second_cont_per_st_phone"
    t.string   "inc_activity_sphere"
    t.string   "inc_record_of_service"
    t.string   "inc_post"
    t.string   "inc_salary"
    t.string   "inc_org_name"
    t.string   "inc_org_city"
    t.string   "inc_org_street"
    t.string   "inc_org_house"
    t.string   "inc_org_building"
    t.string   "inc_org_office"
    t.string   "inc_org_phone"
    t.string   "inc_org_site"
    t.integer  "return_term"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_as_reg"
    t.string   "second_cont_per_first_name"
    t.string   "second_cont_per_mob_phone"
    t.string   "photo"
    t.string   "personal_mobile_phone"
    t.string   "personal_email"
    t.string   "personal_full_name"
  end

  create_table "loans", :force => true do |t|
    t.float    "amount"
    t.integer  "term"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_repaid",  :default => false
  end

end
