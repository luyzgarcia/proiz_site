class RenamePrincialToPrincipal < ActiveRecord::Migration
  def change
    rename_column :trabalhos, :descricao_princial, :descricao_principal
  end
end
