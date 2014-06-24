class InicialController < ApplicationController
  def index
    @trabalhos = Trabalho.last(5)
    @noticias = Noticia.last(3)
    
    EspecialidadeMailer.email_teste.deliver
    
    
  end
end
