class ContatoController < ApplicationController
  before_action :setMetaTags
  
  def index
    
  end  
  
  def enviado
    @nome = params[:nome]
    @email = params[:email]
    @telefone = params[:telefone]
    @mensagem = params[:mensagem]
    render :enviado
  end
   
  def contato
    dados = {nome: params[:nome], 
             sobrenome: params[:email],
             telefone: params[:telefone],
             telefone: params[:mensagem]}
             
    ProizMailer.contato(dados).deliver
  end
  
  private 
  def setMetaTags
    set_meta_tags :title => 'Proiz - Comunicação integrada | Contato'
  end
  
end
