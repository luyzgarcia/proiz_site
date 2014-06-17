class Admin::NoticiasController < Admin::AdminController
  respond_to :json, :html
  
  def index
    @noticias = Noticia.all.order(:id)
  end

  def new
    @noticia = Noticia.new
  end
  
  def create
    @noticia = Noticia.new(noticia_params)
    if @noticia.save
      respond_to do |format|
        format.html {redirect_to admin_noticias_path}
        format.js {redirect_to admin_noticias_path}
      end
    else
      respond_to do |format|
        format.html {render action: 'new'}
        format.js { render action: 'new'}
      end
    end
    
  end

  def edit
    @noticia = Noticia.find(params[:id])
    #@artigo_id = @artigo.id
    @editando = true
    respond_to do |format|
       format.html {render action: 'new'}
       format.js { render action: 'new'}
    end
  end

  def destroy
    @noticia = Noticia.find_by_id(params[:id])
    #@noticia.destroy
    
    @noticia_id = @noticia.id
    respond_to do |format|
      format.js { render action: 'destroy'}
    end
  end
  
  def update
    @noticia = Noticia.find(params[:id])
    
    @noticia_id = @noticia.id
    if(@noticia.update!(noticia_params))
      respond_to do |format|
          @noticias = Noticia.all.order(:id)
          format.js { render :index }
          format.html { redirect_to admin_noticias_path}
        end
    end
  end
  
  def mudarstatus
    @noticia = Noticia.find(params[:id])
    if(@noticia.status == 1)
      @noticia.update_attribute(:status, 0)
    else
      @noticia.update_attribute(:status, 1)             
    end
    
    @noticia.save
    
    respond_to do |format|
      format.html { redirect_to admin_noticias_path}
      format.js { redirect_to admin_noticias_path}
     end     
  end
  
  def noticia_params
    params.require(:noticia).permit(:id,:titulo,:conteudo,:status,:noticiacateg_id,:imagem_miniatura,
    {:recurso_attributes => [:id, :artigo_id, :descricao]})
  end
  
end