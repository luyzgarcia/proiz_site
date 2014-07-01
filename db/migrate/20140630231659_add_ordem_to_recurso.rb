class AddOrdemToRecurso < ActiveRecord::Migration
  def change
    add_column :recursos, :ordem, :int
  end
end
