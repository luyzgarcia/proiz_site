class CreateFichatecnicas < ActiveRecord::Migration
  def change
    create_table :fichatecnicas do |t|
      t.string :chave
      t.string :valor
      t.integer :trabalho_id

      t.timestamps
    end
  end
end
