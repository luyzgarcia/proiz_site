class CreateSiteinfos < ActiveRecord::Migration
  def up
    create_table :siteinfos do |t|
      t.string :nomesite
      t.string :sobre
      t.string :metatags
      t.string :logradouro
      t.integer :numero
      t.string :pais
      t.string :estado
      t.string :cidade
      t.string :bairro
      t.string :telefone
      t.string :email

      t.timestamps
    end
    
    Siteinfo.create(nomesite: "Proiz", sobre: "Agência de comunicação integrada. Publicidade e propaganda, design gráfico e marketing digital. Soluções completas para a construção de marcas fortes.")
    ''
  end
  
  def down
    drop_table :siteinfos
  end
  
end
