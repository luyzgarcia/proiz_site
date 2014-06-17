class NoticiacategoriaController < ApplicationController
  
  def create
    logger.info("Entrou no create")
    @noticiacategoria = Noticiacategoria.new(noticiacategoria_params)
    if @noticiacategoria.save
      respond_to do |format|
        format.js {redirect_to noticiacategoria_index_path}
      end
    else
      respond_to do |format|
        format.js {render action: 'new'}
      end
    end
  end
  
  def new
    @editando = nil
    @noticiacategoria = Noticiacategoria.new
    respond_to do |format|
      format.js {render action: 'new'}
      format.html {render action: 'new'}
    end
  end

  def index
    @noticiacategorias = Noticiacategoria.all.order(:id)
    respond_to do |format|
      format.js
    end
  end

  def edit
    @noticiacategoria = Noticiacategoria.find(params[:id])
    @noticiacateg_id = @noticiacategoria.id
    @editando = true
    respond_to do |format|
      format.js {render action: 'edit'}
    end
  end

  def destroy
    @noticiacategoria = Noticiacategoria.find(params[:id])
    #@noticiacateg.destroy
    
    @noticiacateg_id = @noticiacategoria.id
    respond_to do |format|
      format.js {render action: 'destroy'}
    end
  end

  def update
    logger.info "entrou update"
    @noticiacategoria = Noticiacategoria.find(params[:id])
    
    if(@noticiacategoria.update!(noticiacategoria_params))
      respond_to do |format|        
        format.js { redirect_to noticiacategoria_index_path }
      end
    else
      logger.info "Nao salvou edicao"
      respond_to do |format|
        format.js {render action: 'edit'}
      end   
    end 
  end
  
  private
  
  def noticiacategoria_params
    params.require(:noticiacategoria).permit(:id,:titulo,:status,:descricao)
  end
end
