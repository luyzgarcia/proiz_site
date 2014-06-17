class CreateDatabaseStructure < ActiveRecord::Migration
  def change
    # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artigos", force: true do |t|
    t.string   "titulo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "conteudo"
    t.integer  "status",          limit: 2
    t.integer  "noticiacateg_id"
  end

  create_table "categoriatrabalhos", force: true do |t|
    t.string   "titulo"
    t.integer  "status",     limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", force: true do |t|
    t.string   "nome"
    t.string   "logo_img"
    t.string   "descricao"
    t.string   "url_site"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",            limit: 2
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "especialidades", force: true do |t|
    t.string   "titulo"
    t.text     "conteudo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagem_principal_file_name"
    t.string   "imagem_principal_content_type"
    t.integer  "imagem_principal_file_size"
    t.datetime "imagem_principal_updated_at"
    t.integer  "status",                        limit: 2
  end

  create_table "fichatecnicas", force: true do |t|
    t.string   "chave"
    t.string   "valor"
    t.integer  "trabalho_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ordem",       default: 0
  end

  create_table "imagems", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "trabalho_id"
    t.string   "descricao"
    t.integer  "ordem",              default: 0
  end

  create_table "noticiacategs", force: true do |t|
    t.string   "titulo"
    t.integer  "status",     limit: 2
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noticias", force: true do |t|
    t.string   "titulo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "conteudo"
    t.integer  "status",                        default: 0
    t.integer  "noticiacateg_id"
    t.string   "imagem_miniatura_file_name"
    t.string   "imagem_miniatura_content_type"
    t.integer  "imagem_miniatura_file_size"
    t.datetime "imagem_miniatura_updated_at"
  end

  create_table "paginas", force: true do |t|
    t.string "titulo"
    t.string "descricao"
  end

  create_table "recursos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descricao"
    t.integer  "artigo_id"
  end

  create_table "trabalhos", force: true do |t|
    t.string   "titulo"
    t.text     "ficha"
    t.text     "introducao"
    t.integer  "status",                        limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "categoria_id"
    t.string   "imagem_principal_file_name"
    t.string   "imagem_principal_content_type"
    t.integer  "imagem_principal_file_size"
    t.datetime "imagem_principal_updated_at"
    t.string   "imagem_vitrine_file_name"
    t.string   "imagem_vitrine_content_type"
    t.integer  "imagem_vitrine_file_size"
    t.datetime "imagem_vitrine_updated_at"
    t.string   "orientacao"
    t.string   "descricao_principal"
    t.string   "descricao_vitrine"
    t.integer  "ordem"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "status"
  end
  end
end
