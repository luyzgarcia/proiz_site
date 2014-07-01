class CreateRecursos < ActiveRecord::Migration
  def change
    create_table :recursos do |t|
      t.string :descricao
      t.belongs_to :noticia
      
      t.timestamps
    end
    
    
    
  end
end
