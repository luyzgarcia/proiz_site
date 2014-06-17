class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :logo_img
      t.string :descricao
      t.string :url_site

      t.timestamps
    end
  end
end
