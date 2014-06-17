class CreateNoticiacategoria < ActiveRecord::Migration
  def change
    create_table :noticiacategoria do |t|
      t.string :titulo
      t.integer :status, :limit => 1
      t.text :descricao

      t.timestamps
    end
  end
end
