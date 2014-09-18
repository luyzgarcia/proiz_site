class CreateMetatag < ActiveRecord::Migration
  def change
    create_table :metatags do |t|
      t.string :title
      t.string :og_sitename
      t.string :og_title
      t.string :og_description
      t.string :keywords
      t.timestamps
    end
  end
end
