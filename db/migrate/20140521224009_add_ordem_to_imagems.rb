class AddOrdemToImagems < ActiveRecord::Migration
  def change
    add_column :imagems, :ordem, :int, :default => 0
  end
end
