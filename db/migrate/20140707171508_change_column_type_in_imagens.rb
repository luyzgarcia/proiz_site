class ChangeColumnTypeInImagens < ActiveRecord::Migration
  def change
      change_column :imagems, :descricao, :text
  end
end
