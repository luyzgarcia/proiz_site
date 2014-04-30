class ClientesController < ApplicationController
  
  def show
  end

  def index
  end
  
  #Método chamando quando o usuario ira cadastras um novo cliente
  #Ele ira instanciar o novo cliente e renderizar para a tela new
  def new
    @cliente = Cliente.new
    respond_to do |format|
      format.js { render action: 'new' }
      format.html { render action: 'new' }
    end
    
  end
  
  #Método chamando quando o usuario tenta salvar um novo cliente
  #o Cliente sera validado, caso tudo esteja preenchido ele retorna uma mensagem com o usuario
  #cadastrado, mas caso o usuario nao tenha preenchido todos os campos ele ira dar uma 
  #mensagem mostrando os campos obrigatorios
  def create    
    @cliente = Cliente.new(cliente_params)
    if(@cliente.save)
      respond_to do |format|
        format.js { render action: "show"}
      end
    else          
      respond_to do |format|
        format.js { render action: 'new'}
      end
    end
  end

  def edit
  end

  def delete
  end

  def update
  end
  
  
  private 
  
  def cliente_params
    params.require(:cliente).permit(:nome, :descricao, :url_site)
  end
end
