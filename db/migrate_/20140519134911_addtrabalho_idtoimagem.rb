class AddtrabalhoIdtoimagem < ActiveRecord::Migration
  def change
    add_column :imagems, :trabalho_id, :integer
  end
end
