class NoticiasController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :getcategorias, :setmetaTags
  
  def setmetaTags
    set_meta_tags :title => 'Noticias'
                  #:description => "All text about keywords, other keywords" 
  end
  
  def set_metatags_facebook(noticia)
    #logger.info 'set metatags facebook'
    set_meta_tags :title => noticia.titulo,
                  :description => truncate(noticia.conteudo.html_safe,:ommision => "... Leia mais", :length => 200),
                  :og => {
                    :site_name => ["Proiz"],
                    :url => [noticia_url(noticia)],
                    :title => [noticia.titulo],
                    :image => [noticia.imagem_miniatura(:original)],
                    :description => [truncate(noticia.conteudo.html_safe,:ommision => "... Leia mais", :length => 200)]
                  }
  end
  
  def index
    ultimasnoticias
    @destaque = noticiadestaque
    getcategorias
    respond_to do |format|
      format.html
      format.js {render 'index_remote'}
    end
  end
  
  def filtrar
    cat_id = params[:id]
    if cat_id > '0'
      @noticias = Noticia.all.where(noticiacateg_id: cat_id).ativo.limit(6)
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
    @noticia = Noticia.friendly.find(params[:id])
    set_metatags_facebook(@noticia)
  end
  
  def mais_noticias
    @ds = params[:num_noticias]
    @noticias = Noticia.all.order(:created_at).where('status = 1').limit(6).offset(@ds)
    respond_to do |format|
      format.js
    end
  end

  private
  
  def getcategorias
    @categorias = Noticiacateg.all.where('status = 1')
  end
  
  def noticiadestaque
    @destaque = Noticia.ativo.last
  end
  
  def ultimasnoticias
    @noticias = Noticia.all.order(created_at: :desc).limit(6).ativo
  end
  
end
