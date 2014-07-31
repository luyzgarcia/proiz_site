class InicialController < ApplicationController
  before_action :set_metatags_facebook
  
  def index
    @trabalhos = Trabalho.where(:idioma => I18n.locale ).where("tipo != 'M' and vitrine_destaque = 1 and imagem_principal_file_name != ''").order(:ordem).last(5)
    @noticias = Noticia.last(3)
  end
  
  def set_metatags_facebook
    set_meta_tags :title => 'Proiz - Comunicação integrada',
                  :og => {
                    :site_name => ["Proiz - Comunicação integreda"],
                    :url => [root_url],
                    :title => ['Proiz - Comunicação integreda'],
                    :image => [('/assets/logo_proiz.png')]
                   }
  end
end
