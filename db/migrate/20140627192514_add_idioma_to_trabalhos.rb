class AddIdiomaToTrabalhos < ActiveRecord::Migration
  def change
    add_column :trabalhos, :idioma, :string
  end
end
