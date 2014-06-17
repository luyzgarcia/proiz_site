class AddAttachmentImageToImagems < ActiveRecord::Migration
  def self.up
    change_table :imagems do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :imagems, :image
  end
end
