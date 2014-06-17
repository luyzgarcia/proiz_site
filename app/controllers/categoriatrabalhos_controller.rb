class CategoriatrabalhosController < ApplicationController
  respond_to :json
  
  def index
    @categorias = Categoriatrabalho.all.order(:id)
  end

  def new
    @categoria = Categoriatrabalho.new
  end
  
  def create
    @categoria = Categoriatrabalho.new(categoriatrabalho_params)
    if(@categoria.save)
      respond_to do |format|
        format.js { redirect_to categoriatrabalhos_index_path}
      end
    else          
      respond_to do |format|
        format.js { render action: 'new'}
      end
    end
  end

  def edit
    @categoria = Categoriatrabalho.find(params[:id])
    @editando = true
    #respond_to do |format|
    #  format.js { render action: 'edit'}
    #end
  end

  def update
    @categoria = Categoriatrabalho.find(params[:id])
    #begin
      if(@categoria.update!(categoriatrabalho_params))
        respond_to do |format|
            @categorias = Categoriatrabalho.all.order(:id)
            format.js { render :index }
          end         
      end
  end

  def destroy
    
    @categoria = Categoriatrabalho.find(params[:id])
    #@cliente.destroy
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
      format.js { redirect_to categoriatrabalhos_path}
     end     
  end
  
  private 
  
  def categoriatrabalho_params
    params.require(:categoriatrabalho).permit(:id,:titulo,:status)
  end
end
