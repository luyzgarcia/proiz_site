class AddDescricaoToImagem < ActiveRecord::Migration
  def change
    add_column :imagems, :descricao, :string
  end
end
