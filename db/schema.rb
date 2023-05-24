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

ActiveRecord::Schema[7.0].define(version: 2023_05_24_181438) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "cliente_proveedors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.float "promedio"
    t.text "comentarios"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cliente_proveedors_on_user_id"
  end

  create_table "evaluaciones_anuales", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.integer "ano", null: false
    t.integer "performance", null: false
    t.string "potencial", null: false
    t.string "curva", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_evaluaciones_anuales_on_user_id"
  end

  create_table "upward_fbks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.float "promedio", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_upward_fbks_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nombre", null: false
    t.string "apellidos", null: false
    t.string "email"
    t.string "password_digest", null: false
    t.integer "idm4"
    t.date "cumpleanos"
    t.date "fecha_ingreso"
    t.string "estudios", default: [], array: true
    t.string "universidad"
    t.string "direccion"
    t.string "puesto"
    t.integer "pc_cat"
    t.text "resumen"
    t.boolean "key_talent", default: false
    t.string "encuadre"
    t.integer "cet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "estructura3"
    t.string "estructura4"
    t.string "estructura5"
  end

end
