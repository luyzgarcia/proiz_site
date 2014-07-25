class CreateLabSliders < ActiveRecord::Migration
  def change
    create_table :lab_sliders do |t|
      t.string :titulo
      t.integer :status, :default => 1
      t.timestamps
    end
    add_attachment :lab_sliders, :imagem
  end
end
