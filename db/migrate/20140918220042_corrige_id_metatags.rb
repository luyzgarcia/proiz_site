class CorrigeIdMetatags < ActiveRecord::Migration
  def change
    remove_column :trabalhos, :id_metatag
    add_column :trabalhos, :metatag_id, :integer
  end
end
