class AddImagemIdToTrabalho < ActiveRecord::Migration
  def change
    add_column :trabalhos, :imagem_id, :integer
  end
end
