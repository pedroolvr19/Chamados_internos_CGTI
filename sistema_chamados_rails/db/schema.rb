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

ActiveRecord::Schema[8.0].define(version: 2026_02_11_161649) do
  create_table "chamado_historicos", force: :cascade do |t|
    t.integer "chamado_id", null: false
    t.string "tecnico_antigo"
    t.string "tecnico_novo"
    t.datetime "data_alteracao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chamado_id"], name: "index_chamado_historicos_on_chamado_id"
  end

  create_table "chamados", force: :cascade do |t|
    t.date "data_solicitacao"
    t.time "hora_solicitacao"
    t.string "nome_solicitante"
    t.string "ramal"
    t.string "setor"
    t.string "andar"
    t.text "descricao_solicitacao"
    t.text "constatado"
    t.text "providencia"
    t.text "providenciado"
    t.string "status"
    t.text "detalhe"
    t.string "tecnico_responsavel"
    t.datetime "data_fechamento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tecnicos", force: :cascade do |t|
    t.string "nome"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_tecnicos_on_nome"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chamado_historicos", "chamados"
end
