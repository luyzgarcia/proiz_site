class AddCategoriaIdToUTrabalho < ActiveRecord::Migration
  def change
    add_column :trabalhos, :categoria_id, :integer
  end
end
