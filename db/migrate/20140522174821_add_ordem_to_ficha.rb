class AddOrdemToFicha < ActiveRecord::Migration
  def change
    add_column :fichatecnicas, :ordem, :int, :default => 0
  end
end
