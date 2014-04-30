class PaginasController < ApplicationController
  layout "painel"
  
  def index
    @paginas = Pagina.all
  end
  
end
