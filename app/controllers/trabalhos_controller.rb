class TrabalhosController < ApplicationController
  respond_to :json, :html
  before_action :allow_facebook_iframe
  
  def index
    @trabalhos = getTrabalhos.where("categoria_id IS NOT NULL and tipo != 'M'").where(status: '1')
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
      @trabalhos = getTrabalhos.where(categoria_id: cat_id)
    else
      @trabalhos = getTrabalhos.where("tipo != 'M'")
    end
  end
  
  def filtrarmidia
    cat_id = params[:id]
    if cat_id == '0'
      @trabalhos = getTrabalhos.where("tipo = 'M'")
    elsif cat_id == '1'
      #Pega titulos facebook
      #@trabalhos = Trabalho.all.where("introducao LIKE?", /facebook.com(.*)/)
      @trabalhos = getTrabalhos.where("introducao LIKE ?" , '%facebook.com%')
    elsif cat_id == '2'
      #Pega titulos instagram
      @trabalhos = getTrabalhos.where("introducao LIKE ?" , '%instagram.com%')
    end
    
    respond_to do |format|
      format.js { render 'filtrar' }
    end
  end
  
  def midias_sociais
    #@trabalhosmidias = Trabalho.all.where("introducao LIKE ?" , '%facebook.com%')
    @trabalhosmidias = getTrabalhos.where("tipo = 'M'")
    
  end
  

  private

  def allow_facebook_iframe
    #logger.info 'entoru'
    response.headers.except! 'X-Frame-Options'
  end
  
  def getTrabalhos
    @trabalhos = Trabalho.all.where(:idioma => I18n.locale )
  end
end
