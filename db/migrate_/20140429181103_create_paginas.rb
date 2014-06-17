class CreatePaginas < ActiveRecord::Migration
  def change
    create_table :paginas do |t|
      t.string :titulo
      t.string :descricao
    end
  end
end
