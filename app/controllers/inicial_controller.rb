class InicialController < ApplicationController
  before_action :set_metatags_facebook
  
  def index
    @trabalhos = Trabalho.where(:idioma => I18n.locale ).where("tipo != 'M' and vitrine_destaque = 1 and imagem_principal_file_name != ''").order(:ordem).last(5)
    @noticias = Noticia.order(created_at: :desc).first(3)
  end
  
  def set_metatags_facebook
    set_meta_tags :title => 'Proiz - Design, marketing e publicidade.',
                  :og => {
                    :site_name => ["Proiz - Design, marketing e publicidade."],
                    :url => [root_url],
                    :title => ['Proiz - Comunicação integreda'],
                    :image => [('/assets/logo_proiz.png')]
                   }
  end
end
