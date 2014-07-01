class AddAttachmentArquivoToRecursos < ActiveRecord::Migration
  def self.up
    change_table :recursos do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    drop_attached_file :recursos, :arquivo
  end
end
