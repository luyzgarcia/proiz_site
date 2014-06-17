class AddTituloToNoticia < ActiveRecord::Migration
  def change
    add_column :noticia, :titulo, :string
  end
end
