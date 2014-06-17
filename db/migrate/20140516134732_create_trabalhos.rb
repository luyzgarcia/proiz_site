class CreateTrabalhos < ActiveRecord::Migration
  def change
    create_table :trabalhos do |t|
      t.string :titulo
      t.text :ficha
      t.text :introducao
      t.integer :status, :limit => 1

      t.timestamps
    end
  end
end
