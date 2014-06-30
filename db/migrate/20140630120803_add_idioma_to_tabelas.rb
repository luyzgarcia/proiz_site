class AddIdiomaToTabelas < ActiveRecord::Migration
  def change
    add_column :especialidades, :idioma, :string
    add_column :noticiacategs, :idioma, :string
    add_column :noticias, :idioma, :string
    add_column :categoriatrabalhos, :idioma, :string
  end
end
