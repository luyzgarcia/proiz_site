class ContatoController < ApplicationController
  
  def index
    
  end  
  
  def enviado
    @nome = params[:nome]
    @email = params[:email]
    @telefone = params[:telefone]
    @mensagem = params[:mensagem]
    render :enviado
  end
   
  
end
