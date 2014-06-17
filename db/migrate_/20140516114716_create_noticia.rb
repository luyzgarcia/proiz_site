class CreateNoticia < ActiveRecord::Migration
  def change
    create_table :noticias do |t|
      t.string :titulo
      t.integer :status

      t.timestamps
    end
  end
end
