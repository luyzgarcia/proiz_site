class AddSlugToNoticias < ActiveRecord::Migration
  def change
    add_column :noticias, :slug, :string
    add_index :noticias, :slug
  end
end
