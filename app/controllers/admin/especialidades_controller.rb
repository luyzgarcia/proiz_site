class Admin::EspecialidadesController < Admin::AdminController
  
  before_action :getEspecialidades, only:[:index]
  
  respond_to :json, :html  
  
  
  
  def index
    #@especialidades = Especialidade.all.order(:id)    
  end
  
  def new
    @editando = nil
    @especialidade = Especialidade.new
  end
  
  def create
    @especialidade = Especialidade.new(especialidade_params)
    if @especialidade.save
      respond_to do |format|
        @especialidades = getEspecialidades        
        format.html {redirect_to admin_especialidades_path}
        format.js {redirect_to admin_especialidades_path}
      end
    else
      respond_to do |format|
         format.html {render action: 'new'}
         format.js { render action: 'new'}
      end
    end
  end
  
  def edit
    @especialidade = Especialidade.find(params[:id])
    @especialidade_id = @especialidade.id
    @editando = true
  end
  
  def destroy
    @especialidade = Especialidade.find(params[:id])
    @especialidade.destroy
    @especialidade_id = @especialidade.id
  end    
  
  def update
    @especialidade = Especialidade.find(params[:id])
    if @especialidade.update(especialidade_params)
      respond_to do |format|
        @especialidades = getEspecialidades        
        format.js { render :index }
        format.html { redirect_to admin_especialidades_path}
      end
    else
      @editando = true
      respond_to do |format|
        format.js { render 'edit'}
        format.html { render action: 'edit'}
      end
    end
  end
  
  def mudarstatus
    @especialidade = Especialidade.find(params[:id])
    if @especialidade.status == 1
      @especialidade.update_attribute(:status, 0)
      @especialidade.save
    else
      @especialidade.update_attribute(:status, 1)
      @especialidade.save
    end
    respond_to do |format|
      format.js { redirect_to admin_especialidades_path}
      format.html { redirect_to admin_especialidades_path}
    end
  end
  
  private
  
  def getEspecialidades
    @especialidades = Especialidade.all.where(:idioma => I18n.locale ).order(:id)
  end
  
  def especialidade_params
    params.require(:especialidade).permit(:id, :titulo, :conteudo, :status, :imagem_principal)
  end
  
end
