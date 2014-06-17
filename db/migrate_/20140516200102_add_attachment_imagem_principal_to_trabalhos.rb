class AddAttachmentImagemPrincipalToTrabalhos < ActiveRecord::Migration
  def self.up
    change_table :trabalhos do |t|
      t.attachment :imagem_principal
    end
  end

  def self.down
    drop_attached_file :trabalhos, :imagem_principal
  end
end
