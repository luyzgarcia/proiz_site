class CreateCategoriatrabalhos < ActiveRecord::Migration
  def change
    create_table :categoriatrabalhos do |t|
      t.string :titulo
      t.integer :status, :limit => 1

      t.timestamps
    end
  end
end
