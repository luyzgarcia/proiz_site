class AddColorToTrabalhos < ActiveRecord::Migration
  def change
    add_column :trabalhos, :color, :string
  end
end
