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

ActiveRecord::Schema.define(version: 20190415142936) do

  create_table "alternativos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "camino_id"
    t.integer "ruta_id"
    t.integer "alternativo_id"
    t.string "estado", limit: 20
    t.string "obs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "caminos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "cargo_id"
    t.integer "user_id"
    t.integer "ruta_id"
    t.integer "unidade_id"
    t.boolean "alternativo"
    t.integer "correlativo", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "unidade_id"
    t.string "descripcion", limit: 150
    t.integer "nivel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "user_id"
    t.string "numero", limit: 20
    t.string "docvalor", limit: 25
    t.boolean "minimo"
    t.string "referencia"
    t.string "cominterna"
    t.text "justificacion"
    t.boolean "presupuestaria"
    t.boolean "poa"
    t.boolean "existencia"
    t.boolean "cotizacion"
    t.boolean "especificaciones"
    t.boolean "autorizaciones"
    t.boolean "teref"
    t.decimal "total", precision: 10, scale: 2
    t.date "fecha"
    t.string "obs"
    t.string "archivo"
    t.string "otros"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "derivaciones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "camino_id"
    t.integer "cargod_id"
    t.integer "cargoo_id"
    t.integer "ruta_id"
    t.integer "correlativo"
    t.integer "compra_id"
    t.integer "usero_id"
    t.integer "unidadeo_id"
    t.integer "userd_id"
    t.integer "unidadd_id"
    t.date "fecha"
    t.string "estado", limit: 15
    t.string "pagado", limit: 15
    t.string "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "docderivaciones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "compra_id"
    t.integer "cargo_id"
    t.integer "unidade_id"
    t.integer "user_id"
    t.string "derivacione_id"
    t.integer "camino_id"
    t.string "descripcion", limit: 150
    t.string "docvalor", limit: 180
    t.boolean "presento"
    t.string "estado", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "tipo", limit: 120
    t.integer "camino_id"
    t.string "descripcion", limit: 150
    t.integer "correlativo", limit: 2
    t.boolean "presento"
    t.string "observaciones"
    t.string "memorandum", limit: 20
    t.integer "remitente"
    t.text "contenido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "escogidos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "memo_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gestiones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "numero", limit: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "compra_id"
    t.string "descripcion", limit: 150
    t.string "unidad", limit: 15
    t.integer "cantidad"
    t.decimal "p_unitario", precision: 10, scale: 2
    t.decimal "p_referencial", precision: 10, scale: 2
    t.boolean "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "docderivacione_id"
    t.string "cite", limit: 240
    t.text "documento"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ruta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nombre", limit: 150
    t.string "descripcion"
    t.boolean "subruta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "descripcion", limit: 150
    t.boolean "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.boolean "jefe"
    t.integer "unidade_id"
    t.string "nombre"
    t.string "password_salt", limit: 240
    t.string "password_hash", limit: 240
    t.string "username", limit: 240
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted"
    t.string "email", default: ""
    t.boolean "estado"
    t.integer "cargo_id"
    t.string "am", limit: 15
    t.string "ap", limit: 15
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "rol"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
