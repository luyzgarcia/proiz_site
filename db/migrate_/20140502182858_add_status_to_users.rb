class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :int, :limit => 1
  end
end
