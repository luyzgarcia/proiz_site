class Admin::TrabalhosController < Admin::AdminController
  respond_to :json, :html
  #layout "painel"
  
  def index
    @trabalhos = getTrabalhos.order(:id).where("categoria_id IS NOT NULL")
  end
  
  def midias
    @trabalhos = getTrabalhos.order(:id).where("categoria_id IS NULL")
  end

  def new
    @trabalho = Trabalho.new
    @trabalho.tipo = 'T'
    @imagem = Imagem.new
    
  end
  
  def new_midia
    #logger.info 'nova midia'
    @trabalho = Trabalho.new
    @trabalho.tipo = 'M'
    
    #logger.info @trabalho.tipo
    @imagem = Imagem.new    
  end

  def create
    @trabalho = Trabalho.new(trabalho_params)
    
    if(@trabalho.save)
      respond_to do |format|
        if @trabalho.tipo != 'M'
          format.html { redirect_to admin_trabalhos_path}
        else
          format.html { redirect_to admin_trabalhos_midias_path}
        end
        #format.html {
        #  redirect_to admin_trabalhos_path
        #}
        #format.js {
          #redirect_to trabalhos_path
        #  @trabalhos = Trabalho.all.order(:id)
        #  format.js { redirect_to admin_trabalhos_path }
        #}
      end
    else  
      if @trabalho.tipo != 'M'
        respond_to do |format|
          format.html { render action: 'new' }
        end
      else
        respond_to do |format|
          format.html { render action: 'new_midia'}
        end   
      end
    end
  end

  def edit
    @trabalho = Trabalho.find(params[:id])
    @imagem = Imagem.new
    @editando = true
    respond_to do |format|
      if @trabalho.tipo != 'M'
        format.html { render action: 'edit'}
      else
        format.html { render action: 'edit_midia'}
      end
    end
  end

  def update
    @trabalho = Trabalho.find(params[:id])
    
    @trabalho_id = @trabalho.id
    if(@trabalho.update(trabalho_params))
      respond_to do |format|
          @trabalhos = getTrabalhos.order(:id)
          format.js { render :index }
          if @trabalho.tipo != 'M'
            format.html { redirect_to admin_trabalhos_path}
          else
            format.html { redirect_to admin_trabalhos_midias_path}
          end
      end
    else          
        @editando = true
        if @trabalho.tipo != 'M'
          respond_to do |format|
            format.html { render action: 'edit' }
          end    
          else
          respond_to do |format|
            format.html { render action: 'edit_midia' }
          end
        end
    end
  end

  def destroy
    @trabalho = Trabalho.find_by_id(params[:id])
    @trabalho.destroy
    
    @trabalho_id = @trabalho.id
    respond_to do |format|
      format.js { render action: 'destroy'}
    end
  end
  
  def mudarstatus
    @trabalho = Trabalho.find(params[:id])
    if(@trabalho.status == 1)
      @trabalho.update_attribute(:status, 0)
    else
      @trabalho.update_attribute(:status, 1)             
    end
    
    @trabalho.save
    
    respond_to do |format|
      if @trabalho.categoria_id != nil
        format.html { redirect_to admin_trabalhos_path}
        format.js { redirect_to admin_trabalhos_path}
      else
        format.html { redirect_to admin_trabalhos_midias_path}
      end
     end     
  end
  
  def salvarimagem
    
  end
  
  def lista_trabalhos
    @trabalhos = getTrabalhos
  end
  
  private
  
  def getTrabalhos
    @trabalhos = Trabalho.all.where(:idioma => I18n.locale )
  end
  
  def trabalho_params
    params.require(:trabalho).permit(:id, :titulo, :ficha, :introducao, :status, :tipo, :categoria_id, :imagem_principal, :imagem_vitrine,
      :imagems,:orientacao, :descricao_principal, :descricao_vitrine,
      {:imagems_attributes => [:id, :image, :descricao, :_destroy, :trabalho_id, :ordem]},
      {:fichatecnicas_attributes => [:id, :chave, :valor, :_destroy, :trabalho_id, :ordem]}
      )
  end  
  
end
