class ClientesController < ApplicationController
  
  def show
    logger.info "ENtrou no show"
    @clientes = Cliente.all
  end

  def index
    @clientes = Cliente.all
    respond_to do |format|
      format.js
    end
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
        format.js { redirect_to clientes_show_path}
      end
    else          
      respond_to do |format|
        format.js { render action: 'new'}
      end
    end
  end

  def edit
    logger.info "Editar o cliente"
    @cliente = Cliente.find(params[:id])
    @cliente_id = @cliente.id
    respond_to do |format|
      format.js { render action: 'edit'}
    end
  end

  def destroy
    @cliente = Cliente.find(params[:id])
    #@cliente.destroy
    
    @cliente_id = @cliente.id
    respond_to do |format|
      format.js { render action: 'destroy'}
    end
  end

  def update
    
  end
  
  
  private 
  
  def cliente_params
    params.require(:cliente).permit(:id,:nome, :descricao, :url_site)
  end
end
