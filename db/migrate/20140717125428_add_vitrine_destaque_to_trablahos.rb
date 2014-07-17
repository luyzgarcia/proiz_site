class AddVitrineDestaqueToTrablahos < ActiveRecord::Migration
  def change
    remove_column :trabalhos, :ordem
  
    add_column :trabalhos, :ordem, :int, :default => 0
    add_column :trabalhos, :vitrine_destaque, :int, :default => 0
  end
end
