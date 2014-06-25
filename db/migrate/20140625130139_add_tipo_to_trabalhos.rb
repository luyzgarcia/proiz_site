class AddTipoToTrabalhos < ActiveRecord::Migration
  def change
    add_column :trabalhos, :tipo, :string
  end
end
