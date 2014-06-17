class TrabalhosController < ApplicationController
  respond_to :json, :html
  before_action :allow_facebook_iframe
  
  def index
    @trabalhos = getTrabalhos.where("categoria_id IS NOT NULL")
    @categorias = Categoriatrabalho.all
  end
  
  def detalhe
    @trabalho = Trabalho.find(params[:id])
    response.headers.delete('X-Frame-Options')
    respond_to do |format|
      if @trabalho.categoria_id != nil
        format.js { render 'detalhe_trabalho' }
      else
        format.js { render 'detalhe_trabalho_midia' }
      end         
    end
  end
  
  def filtrar
    cat_id = params[:id]
    if cat_id > '0'
      @trabalhos = Trabalho.all.where(categoria_id: cat_id)
    else
      @trabalhos = Trabalho.all.where("categoria_id IS NOT NULL")
    end
  end
  
  def midias_sociais
    @trabalhosmidias = getTrabalhos.where("categoria_id IS NULL")
  end
  

  private

  def allow_facebook_iframe
    logger.info 'entoru'
    response.headers.except! 'X-Frame-Options'
  end
  
  def getTrabalhos
    @trabalhos = Trabalho.all
  end
end
