class RenameNomeOnUsers < ActiveRecord::Migration
  def change
    rename_column :users, :nome, :name
  end
end
