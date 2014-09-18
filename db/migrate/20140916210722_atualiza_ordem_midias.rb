class AtualizaOrdemMidias < ActiveRecord::Migration
  def change
    execute "UPDATE trabalhos SET ordem = id WHERE tipo = 'M'"
  end
end
