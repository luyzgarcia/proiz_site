class AddSlugToTrabalho < ActiveRecord::Migration
  def change
    add_column :trabalhos, :slug, :string
    add_index :trabalhos, :slug
  end
end
