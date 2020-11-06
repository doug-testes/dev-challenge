# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_04_032426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street", default: "", null: false
    t.string "number", default: "", null: false
    t.string "postal_code", default: "", null: false
    t.string "complement", default: "", null: false
    t.string "neighbourhood", default: "", null: false
    t.string "city", default: "", null: false
    t.string "state", default: "", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_addresses_on_company_id"
  end

  create_table "borrower_installments", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.bigint "borrower_request_id", null: false
    t.bigint "amount_in_cents", default: 0, null: false
    t.date "due_date", null: false
    t.integer "installment_number", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["borrower_request_id"], name: "index_borrower_installments_on_borrower_request_id"
  end

  create_table "borrower_requests", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.bigint "loan_amount_in_cents", default: 0, null: false
    t.decimal "rate", default: "0.015", null: false
    t.integer "installments", default: 12, null: false
    t.bigint "installments_amount_in_cents", default: 0, null: false
    t.bigint "total_amount_payable_in_cents", default: 0, null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "cnpj", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "name", default: "", null: false
    t.bigint "borrower_request_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["borrower_request_id"], name: "index_companies_on_borrower_request_id"
  end

  add_foreign_key "addresses", "companies"
  add_foreign_key "borrower_installments", "borrower_requests"
  add_foreign_key "companies", "borrower_requests"
end
