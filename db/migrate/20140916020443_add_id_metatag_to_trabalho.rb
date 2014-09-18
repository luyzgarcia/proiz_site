class AddIdMetatagToTrabalho < ActiveRecord::Migration
  def change
    add_column :trabalhos, :id_metatag, :integer
  end
end
