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

ActiveRecord::Schema.define(version: 2020_11_14_031851) do

  create_table "arms", force: :cascade do |t|
    t.string "name"
    t.string "element"
    t.integer "dexterity"
    t.integer "attack"
    t.integer "counter"
    t.integer "recoil"
    t.integer "speed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "backs", force: :cascade do |t|
    t.string "name"
    t.string "element"
    t.integer "dexterity"
    t.integer "attack"
    t.integer "counter"
    t.integer "recoil"
    t.integer "speed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "battle_parties", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "battle_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "battle_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "battles", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "charged_attacks", force: :cascade do |t|
    t.string "name"
    t.integer "damage_points"
    t.string "element"
    t.string "weakness_element"
    t.string "strength_element"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fast_attacks", force: :cascade do |t|
    t.string "name"
    t.integer "damage_points"
    t.string "element"
    t.string "weakness_element"
    t.string "strength_element"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "heads", force: :cascade do |t|
    t.string "name"
    t.string "element"
    t.integer "dexterity"
    t.integer "attack"
    t.integer "counter"
    t.integer "recoil"
    t.integer "speed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "identities", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "legs", force: :cascade do |t|
    t.string "name"
    t.string "element"
    t.integer "dexterity"
    t.integer "attack"
    t.integer "counter"
    t.integer "recoil"
    t.integer "speed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "head_id"
    t.integer "arm_id"
    t.integer "leg_id"
    t.integer "back_id"
    t.integer "fast_attack_id"
    t.integer "charged_attack_id"
    t.string "element"
    t.integer "hp"
    t.integer "current_hp"
    t.integer "dexterity", default: 0
    t.integer "attack", default: 0
    t.integer "counter", default: 0
    t.integer "recoil", default: 0
    t.integer "speed", default: 0
    t.integer "charger", default: 0
    t.integer "battle_party_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["arm_id"], name: "index_monsters_on_arm_id"
    t.index ["back_id"], name: "index_monsters_on_back_id"
    t.index ["charged_attack_id"], name: "index_monsters_on_charged_attack_id"
    t.index ["fast_attack_id"], name: "index_monsters_on_fast_attack_id"
    t.index ["head_id"], name: "index_monsters_on_head_id"
    t.index ["leg_id"], name: "index_monsters_on_leg_id"
    t.index ["user_id"], name: "index_monsters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "uid"
    t.integer "battle_party_id"
    t.string "provider"
    t.integer "experience_points", default: 0
    t.integer "level", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
