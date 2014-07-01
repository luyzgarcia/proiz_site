class InicialController < ApplicationController
  
  def index
    @trabalhos = Trabalho.last(5)
    @noticias = Noticia.last(3)  
  end
end
