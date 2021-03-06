class Admin::CategoriatrabalhosController < Admin::AdminController
  respond_to :json
  
  def index
    @categorias = getCategoriatrabalhos.order(:id)
  end

  def new
    @categoria = Categoriatrabalho.new
  end
  
  def create
    @categoria = Categoriatrabalho.new(categoriatrabalho_params)
    if(@categoria.save)
      respond_to do |format|
        format.js { redirect_to admin_categoriatrabalhos_path}
        format.html { redirect_to admin_categoriatrabalhos_path}
      end
    else          
      respond_to do |format|
        format.js { render action: 'new' }
        format.html {  render action: 'new' }
      end
    end
  end

  def edit
    @categoria = Categoriatrabalho.find(params[:id])
    @editando = true
    respond_to do |format|
       format.html {render action: 'new'}
       format.js { render action: 'new'}
    end
  end

  def update
    @categoria = Categoriatrabalho.find(params[:id])
    #begin
      if(@categoria.update!(categoriatrabalho_params))
        respond_to do |format|
            @categorias = getCategoriatrabalhos.order(:id)
            format.js { render :index }
            format.html { redirect_to admin_categoriatrabalhos_path}
          end         
      end
  end

  def destroy
    
    @categoria = Categoriatrabalho.find(params[:id])
    @categoria.destroy
    @categoria_id = @categoria.id
    respond_to do |format|
      format.js { render action: 'destroy'}
    end
  end
  
  def mudarstatus
    @categoria = Categoriatrabalho.find(params[:id])
    if(@categoria.status == 1)
      @categoria.update_attribute(:status, 0)
    else
      @categoria.update_attribute(:status, 1)             
    end
    
    @categoria.save
    
    respond_to do |format|
      format.js { redirect_to admin_categoriatrabalhos_path}
      format.html { redirect_to admin_categoriatrabalhos_path }
     end     
  end
  
  private 
  
  def getCategoriatrabalhos
    @categorias = Categoriatrabalho.all.where(:idioma => I18n.locale )
  end
  
  def categoriatrabalho_params
    params.require(:categoriatrabalho).permit(:id,:titulo,:status)
  end
end
