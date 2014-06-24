class Admin::NoticiacategsController < Admin::AdminController
  
  def index
    @noticiacategs = Noticiacateg.all.order(:id)
  end
  
  def new
    #@editando = nil
    @noticiacateg = Noticiacateg.new
    #respond_to do |format|
    #  format.js {render action: 'new'}
    #  format.html {render action: 'new'}
    #end
    #logger.info("entrou no new")
  end
  
  def create
    @noticiacateg = Noticiacateg.new(noticiacateg_params)
    if @noticiacateg.save
      respond_to do |format|
        format.js {redirect_to admin_noticiacategs_path}
        format.html {redirect_to admin_noticiacategs_path}
      end
    else
      respond_to do |format|
        format.html {render action: 'new'}
        format.js {render action: 'new'}
      end
    end
  end
  
  
  def edit
    @noticiacateg = Noticiacateg.find(params[:id])
    @editando = true
    respond_to do |format|
      format.html {render action: 'new'}
      format.js {render action: 'new'}
    end
  end

  def destroy
    @noticiacateg = Noticiacateg.find(params[:id])
    @noticiacateg.destroy
    
    @noticiacateg_id = @noticiacateg.id
    respond_to do |format|
      format.js {render action: 'destroy'}
    end
  end

  def update
    @noticiacateg = Noticiacateg.find(params[:id])
    @@noticiacateg_id = @noticiacateg.id
    
    if(@noticiacateg.update!(noticiacateg_params))
      respond_to do |format|
        @noticiacategs = Noticia.all.order(:id)
        format.js { render :index }
        format.html { redirect_to admin_noticiacategs_path}
      end
    else
      respond_to do |format|
        format.js {render action: 'edit'}
      end   
    end 
  end
  
  def mudarstatus
    @noticiacateg = Noticiacateg.find(params[:id])
    if(@noticiacateg.status == 1)
      @noticiacateg.update_attribute(:status, 0)
    else
      @noticiacateg.update_attribute(:status, 1)             
    end
    
    @noticiacateg.save
    
    respond_to do |format|
      format.html { redirect_to admin_noticiacategs_path}
      format.js { redirect_to admin_noticiacategs_path}
     end     
  end
  
  private
  
  def noticiacateg_params
    params.require(:noticiacateg).permit(:id,:titulo,:status,:descricao)
  end
end
