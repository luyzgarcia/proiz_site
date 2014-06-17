class NoticiacategsController < ApplicationController
  
  def create
    logger.info("Entrou no create")
    @noticiacateg = Noticiacateg.new(noticiacateg_params)
    if @noticiacateg.save
      respond_to do |format|
        format.js {redirect_to noticiacategs_index_path}
      end
    else
      respond_to do |format|
        format.js {render action: 'new'}
      end
    end
  end
  
  def new
    @editando = nil
    @noticiacateg = Noticiacateg.new
    respond_to do |format|
      format.js {render action: 'new'}
      format.html {render action: 'new'}
    end
    logger.info("entrou no new")
  end

  def index
    logger.info("entrou no index")
    @noticiacategs = Noticiacateg.all.order(:id)
    respond_to do |format|
      format.js
    end
  end

  def show
  end

  def edit
    @noticiacateg = Noticiacateg.find(params[:id])
    @noticiacateg_id = @noticiacateg.id
    @editando = true
    respond_to do |format|
      format.js {render action: 'edit'}
    end
  end

  def destroy
    @noticiacateg = Noticiacateg.find(params[:id])
    #@noticiacateg.destroy
    
    @noticiacateg_id = @noticiacateg.id
    respond_to do |format|
      format.js {render action: 'destroy'}
    end
  end

  def update
    logger.info "entrou update"
    @noticiacateg = Noticiacateg.find(params[:id])
    
    if(@noticiacateg.update!(noticiacateg_params))
      respond_to do |format|        
        format.js { redirect_to noticiacategs_index_path }
      end
    else
      logger.info "Nao salvou edicao"
      respond_to do |format|
        format.js {render action: 'edit'}
      end   
    end 
  end
  
  private
  
  def noticiacateg_params
    params.require(:noticiacateg).permit(:id,:titulo,:status,:descricao)
  end
end
