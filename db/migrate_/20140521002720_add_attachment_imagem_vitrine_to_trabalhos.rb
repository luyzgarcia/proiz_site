class AddAttachmentImagemVitrineToTrabalhos < ActiveRecord::Migration
  def self.up
    change_table :trabalhos do |t|
      t.attachment :imagem_vitrine
    end
    add_column :trabalhos, :orientacao, :string
    add_column :trabalhos, :descricao_princial, :string
    add_column :trabalhos, :descricao_vitrine, :string
    add_column :trabalhos, :ordem, :integer
  end

  def self.down
    drop_attached_file :trabalhos, :imagem_vitrine
  end
end
