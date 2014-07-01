class CreateRecursos < ActiveRecord::Migration
  def change
    drop_table :recursos
    create_table :recursos do |t|
      t.string :descricao
      t.belongs_to :noticia
      
      t.timestamps
    end
    
    
    
  end
end
