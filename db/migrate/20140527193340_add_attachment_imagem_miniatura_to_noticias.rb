class AddAttachmentImagemMiniaturaToNoticias < ActiveRecord::Migration
  def self.up
    change_table :noticias do |t|
      t.attachment :imagem_miniatura
    end
  end

  def self.down
    drop_attached_file :noticias, :imagem_miniatura
  end
end
