class NoticiasController < ApplicationController
  before_action :getcategorias, :setmetaTags
  
  def setmetaTags
    logger.info 'set metatags'
    set_meta_tags :title => 'Noticias',
                  :description => "All text about keywords, other keywords"
  end
  
  def index
    ultimasnoticias
    @destaque = noticiadestaque
    getcategorias
    respond_to do |format|
      format.html
    end
    
  end
  
  def filtrar
    cat_id = params[:id]
    if cat_id > '0'
      @noticias = Noticia.all.where(noticiacateg_id: cat_id).limit(6)
    else
      @noticias = Noticia.all.order(:created_at).where('status = 1').limit(6)
    end
  end
  
  def buscar
    buscando = params[:search]
    
    @noticias = Noticia.buscar(buscando)
    respond_to do |format|
      if buscando == ''
        ultimasnoticias
        getcategorias
        format.js {render 'index'  }
      else
        format.js
      end
    end
  end
  
  
  def detalhe_noticia
    ultimasnoticias
    @noticia = Noticia.find(params[:id])
  end

  private
  
  def getcategorias
    @categorias = Noticiacateg.all.where('status = 1')
  end
  
  def noticiadestaque
    @destaque = Noticia.first
  end
  
  def ultimasnoticias
    @noticias = Noticia.all.order(:created_at).limit(6).where('status = 1')
  end
  
end
