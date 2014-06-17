class AddNoticiacategidToNoticas < ActiveRecord::Migration
  def change
    rename_column :noticias, :noticiascateg_id, :noticiacateg_id
  end
end
