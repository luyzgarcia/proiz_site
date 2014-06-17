class Admin::ClientesController < Admin::AdminController
  before_action :getClientes, only: [:index]
  
  
  def show
    @clientes = Cliente.all
  end

  def index
    logger.info 'entrou no index'
    #@clientes = Cliente.all.order(:id)
    respond_to do |format|
      format.js
      format.html
    end
  end
  
  def getClientes
    @clientes = Cliente.all.order(:id)
  end
  
  #Método chamando quando o usuario ira cadastras um novo cliente
  #Ele ira instanciar o novo cliente e renderizar para a tela new
  def new
    @cliente = Cliente.new
    respond_to do |format|
      format.js { render action: 'new' }
      format.html
    end
  end
  
  #Método chamando quando o usuario tenta salvar um novo cliente
  #o Cliente sera validado, caso tudo esteja preenchido ele retorna uma mensagem com o usuario
  #cadastrado, mas caso o usuario nao tenha preenchido todos os campos ele ira dar uma 
  #mensagem mostrando os campos obrigatorios
  def create
    logger.info 'Controller certo'
    @cliente = Cliente.new(cliente_params)
    if(@cliente.save)
      respond_to do |format|
        #format.js { redirect_to clientes_index_path}
         @clientes = getClientes
         format.js { render :index }
         format.html { redirect_to admin_clientes_path }
      end
    else          
      respond_to do |format|
        format.js { render action: 'new'}
        format.html { render action: 'new'}
      end
    end
  end

  def edit
    logger.info "Editar o cliente"
    @cliente = Cliente.find(params[:id])
    @editando = true
    respond_to do |format|
      format.js { render action: 'edit'}
      format.html { render action: 'edit'}
    end
  end

  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy
    
    @cliente_id = @cliente.id
    respond_to do |format|
      format.js
      format.html
    end
  end

  def update
    logger.info "Update cliente"
    @cliente = Cliente.find(params[:id])
    @cliente_id = @cliente.id
    #begin
      if(@cliente.update!(cliente_params))
        respond_to do |format|
          #if remotipart_submitted?
          #  logger.info 'foi submitado com remotepart e agora?'
            @clientes = Cliente.all.order(:id)
            format.js { render :index }
            format.html { render :index }
          #else
          #  format.js { redirect_to clientes_path}
          #end
        #end
      end
    #rescue
    #  logger.error "nao pode salvar"
      #respond_to do |format|
        #format.js { redirect_to clientes_path}
    #    format.js {render action: 'edit', notice: 'Não foi possivel salvar as alterações' }
      #end
    #ensure
    #  respond_to do |format|
    #    format.js { redirect_to clientes_path}
    #  end
       
    end
  end
  
  
  def mudarstatus
    logger.info "Entrou no change status"
    @cliente = Cliente.find(params[:id])
    if(@cliente.status == 1)
      @cliente.update_attribute(:status, 0)
    else
      @cliente.update_attribute(:status, 1)             
    end
    
    @cliente.save
    
    respond_to do |format|
      format.js { redirect_to admin_clientes_path}
      format.html {redirect_to admin_clientes_path }
     end     
  end
  
  private 
  
  def cliente_params
    params.require(:cliente).permit(:id,:nome, :descricao, :url_site, :status, :logo)
  end
  
end
