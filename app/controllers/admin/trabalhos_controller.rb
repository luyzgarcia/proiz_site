class Admin::TrabalhosController < Admin::AdminController
  respond_to :json, :html
  #layout "painel"
  
  def index
    @trabalhos = getTrabalhos.where("tipo != 'M'").order(:ordem)
  end
  
  def midias
    @trabalhos = getTrabalhos.where("categoria_id IS NULL").order(:ordem)
  end

  def new
    @trabalho = Trabalho.new
    @trabalho.tipo = 'T'
    @trabalho.build_metatag
    @imagem = Imagem.new
    
  end
  
  def new_midia
    #logger.info 'nova midia'
    @trabalho = Trabalho.new
    @trabalho.tipo = 'M'
    @trabalho.build_metatag
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
    @trabalho = Trabalho.friendly.find(params[:id])
    @imagem = Imagem.new
    @trabalho.build_metatag if @trabalho.metatag == nil
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
    @trabalho = Trabalho.friendly.find(params[:id])
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
    @trabalho = Trabalho.friendly.find(params[:id])
    @trabalho.destroy
    
    @trabalho_id = @trabalho.id
    respond_to do |format|
      format.js { render action: 'destroy'}
    end
  end
  
  def mudarstatus
    @trabalho = Trabalho.friendly.find(params[:id])
    if(@trabalho.status == 1)
      @trabalho.update_attribute(:status, 0)
    else
      @trabalho.update_attribute(:status, 1)             
    end
    
    @trabalho.save
    
    respond_to do |format|
      if @trabalho.tipo != 'M'
        format.html { redirect_to admin_trabalhos_path}
        format.js { render 'status'}
      else
        format.html { redirect_to admin_trabalhos_midias_path}
      end
     end     
  end
  
  def destaque
    @trabalho = Trabalho.friendly.find(params[:id])
    if(@trabalho.vitrine_destaque == 1)
      @trabalho.update_attribute(:vitrine_destaque, 0)
    else
      @trabalho.update_attribute(:vitrine_destaque, 1)             
    end
    
    @trabalho.save
    
    respond_to do |format|
      if @trabalho.tipo != 'M'
        format.html { redirect_to admin_trabalhos_path}
        format.js { render 'destaque'}
      else
        format.html { redirect_to admin_trabalhos_midias_path}
      end
     end     
  end
  
  def subirordem
    @trabalho = Trabalho.friendly.find(params[:id])
    if @trabalho.ordem > 1
      @anterior = Trabalho.find_by_ordem(@trabalho.ordem - 1)
      @trabalho.update_attribute(:ordem, @trabalho.ordem - 1)
      @anterior.update_attribute(:ordem, @anterior.ordem + 1)
      respond_to do |format|
         format.js {render 'subirordem' }
      end
    else
      render nothing: true
    end
  end
  
  def descerordem
    @trabalho = Trabalho.friendly.find(params[:id])
    @maximo = Trabalho.where("tipo != 'M'").maximum(:ordem)
    if @trabalho.ordem < @maximo
      @proximo = Trabalho.find_by_ordem(@trabalho.ordem + 1)
      @trabalho.update_attribute(:ordem, @trabalho.ordem + 1)
      @proximo.update_attribute(:ordem, @proximo.ordem - 1)
      respond_to do |format|
         format.js {render 'descerordem'}
      end
    else
      render nothing: true
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
      :imagems,:orientacao, :descricao_principal, :descricao_vitrine, :metatag, :color, 
      {:imagems_attributes => [:id, :image, :descricao, :_destroy, :trabalho_id, :ordem]},
      {:fichatecnicas_attributes => [:id, :chave, :valor, :_destroy, :trabalho_id, :ordem]},
      {:metatag_attributes => [:id, :title, :keywords, :og_title, :og_description]}
      )
  end
  
end
