class CreateNewsletter < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string  :email
      t.integer :status, :default => 1
    end
    add_index :newsletters, :email
  end
end
