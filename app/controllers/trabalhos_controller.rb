class TrabalhosController < ApplicationController
  include ActionView::Helpers::TextHelper
  respond_to :json, :html
  before_action :getCategorias, only: [:index, :detalhe, :midias_sociais]
  #before_action :getCategorias, only: [:index, :detalhe, :midias_sociais]

  def index
    #@trabalhos = getTrabalhos.where("categoria_id IS NOT NULL and tipo != 'M'").where(status: '1').order("RANDOM()").limit('10')
    @trabalhos = getTrabalhos.where("categoria_id IS NOT NULL and tipo != 'M'").where(status: '1').order(:ordem).limit('5')
    respond_to do |format|
      format.html
      format.xml {render :xml => @trabalhos, :methods => [:imagem_url] }
      format.json {render :json => @trabalhos, :methods => [:imagem_url, :publicado]}
      format.js {render 'index'}
    end

  end
  def midias_sociais
    @trabalhosmidias = getTrabalhos.where("tipo = 'M'").order(:ordem).limit('6')
  end

  def mais_trabalhos
    @num_trabalhos = params[:nr_trabalhos]
    categoria = params[:categoria]
    logger.info '---------------Mais_trabalhos-------------------'
    if categoria > '0'
      @trabalhos = getTrabalhos.where(categoria_id: categoria).where(status: '1').order(:ordem).limit('6').offset(@num_trabalhos)
    else
      @trabalhos = getTrabalhos.where("categoria_id IS NOT NULL and tipo != 'M'").where(status: '1').order(:ordem).limit('6').offset(@num_trabalhos)
    end

    respond_to do |format|
      format.js
    end
  end

  def mais_midias
    @num_midias = params[:nr_trabalhos]
    categoria = params[:categoria]
    if categoria == '0'
      @trabalhos = getTrabalhos.where("tipo = 'M'").limit('6').offset(@num_midias)
    elsif categoria == '1'
      @trabalhos = getTrabalhos.where("introducao LIKE ?" , '%facebook.com%').limit('6').offset(@num_midias)
    elsif categoria == '2'
      @trabalhos = getTrabalhos.where("introducao LIKE ?" , '%instagram.com%').limit('6').offset(@num_midias)
    end

    respond_to do |format|
      format.js
    end
  end

  def detalhe
    @trabalho = Trabalho.friendly.find(params[:id])
    #response.headers.delete('X-Frame-Options')

    set_metatags_facebook(@trabalho)

    @trabalho_prev = Trabalho.trabalho_prev(@trabalho)
    @trabalho_next = Trabalho.trabalho_next(@trabalho)



    respond_to do |format|
      if @trabalho.categoria_id != nil
        format.html {
          #@categorias = getCategorias
          @trabalhos = getTrabalhos.where("categoria_id IS NOT NULL and tipo != 'M'").where(status: '1')
          render 'detalhe_trabalho'
          }
        format.js { render 'detalhe_trabalho' }
      else
        format.html {
          @trabalhos = getTrabalhos.where("tipo != 'M'").where(status: '1')
          render 'detalhe_trabalho_midia'
        }
        format.js { render 'detalhe_trabalho_midia' }
      end
    end

  end

  def filtrar
    @cat_id = params[:id]
    if @cat_id > '0'
      @trabalhos = getTrabalhos.where(categoria_id: @cat_id).limit('6')
    else
      @trabalhos = getTrabalhos.where("tipo != 'M'")
    end
  end

  def filtrarmidia
    @cat_id = params[:id]
    if @cat_id == '0'
      @trabalhos = getTrabalhos.where("tipo = 'M'").limit('6')
    elsif @cat_id == '1'
      @trabalhos = getTrabalhos.where("introducao LIKE ?" , '%facebook.com%').limit('6')
    elsif @cat_id == '2'
      @trabalhos = getTrabalhos.where("introducao LIKE ?" , '%instagram.com%').limit('6')
    end

    respond_to do |format|
      format.js { render 'filtrar' }
    end
  end




  private

  def allow_facebook_iframe
    #logger.info 'entoru'
    #response.headers.except! 'X-Frame-Options'
  end

  def set_metatags_trabalhos
    set_meta_tags :title => 'Proiz - Trabalhos',
                  :og => {
                    :site_name => ["Proiz"],
                    :url => [trabalhos_url],
                    :title => 'Proiz - Trabalhos',
                    :description => 'Trabalhos realizados pela agencia Proiz'
                  }
  end

  def set_metatags_facebook(trabalho)
    set_meta_tags :title => trabalho.metatag != nil && trabalho.metatag.title != '' ? trabalho.metatag.title : trabalho.titulo,
                  :keywords => trabalho.metatag != nil && trabalho.metatag.keywords != '' ? trabalho.metatag.keywords : '',
                  :og => {
                    :site_name => ["Proiz"],
                    :url => [trabalho_url(trabalho)],
                    :title => [trabalho.metatag != nil && trabalho.metatag.og_title != '' ? trabalho.metatag.og_title : trabalho.titulo],
                    :image => [trabalho.imagem_vitrine(:original)],
                    :description => [trabalho.metatag != nil && trabalho.metatag.og_description != '' ? trabalho.metatag.og_description : trabalho.tipo != 'M' ? truncate(trabalho.introducao.html_safe,:ommision => "... Leia mais", :length => 200) : 'Trabalho realizado pela agência PROIZ.']
                  }
   # if trabalho.tipo != 'M'
   #   set_meta_tags :og => {
   #                   :description => [truncate(trabalho.introducao.html_safe,:ommision => "... Leia mais", :length => 200)]
   #               }
   # else
   #   set_meta_tags :og => {
   #                   :description => ['Trabalho realizada pela agência PROIZ.']
   #               }
   # end

  end
  def getCategorias
    @categorias = Categoriatrabalho.all.where(:idioma => I18n.locale )
  end
  def getTrabalhos
    @trabalhos = Trabalho.all.where(:idioma => I18n.locale )
  end
end
