class AddAttachmentLogoToClientes < ActiveRecord::Migration
  def self.up
    change_table :clientes do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :clientes, :logo
  end
end