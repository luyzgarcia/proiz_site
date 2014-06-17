class AddFieldsToNoticia < ActiveRecord::Migration
  def change
    add_column :noticias, :conteudo, :string
    add_column :noticias, :status, :int, :default => 0
    add_column :noticias, :noticiacateg_id, :integer
    
  end
end
