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

ActiveRecord::Schema.define(:version => 20110617150723) do

  create_table "accions", :force => true do |t|
    t.text     "hechos"
    t.integer  "user_id"
    t.integer  "formulario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", :force => true do |t|
    t.string   "login"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "autoridads", :force => true do |t|
    t.string   "name"
    t.integer  "juez_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "derechos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "tipo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formularios_backup", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "arguments"
    t.integer  "derecho_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "juezs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
