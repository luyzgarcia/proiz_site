class InicialController < ApplicationController
  before_action :set_metatags_facebook
  
  def index
    @trabalhos = Trabalho.where(:idioma => I18n.locale ).where("tipo != 'M' and vitrine_destaque = 1 and imagem_principal_file_name != ''").order(:ordem).last(5)
    @noticias = Noticia.last(3)
  end
  
  def set_metatags_facebook
    set_meta_tags :title => 'Proiz - Comunicação integrada',
                  :description => 'A Proiz é uma agência de comunicação integrada onde as melhores práticas do Design Gráfico, Publicidade, Propaganda e Marketing se unem a ideias criativas para fortalecer a construção e promoção de marcas.
Buscando fornecer aos nossos clientes um processo coerente e forte de Branding, organizamos um pacote abrangente de atividades criativas. Estamos prontos para atender as necessidades de comunicação do seu negócio!',
                  :og => {
                    :site_name => ["Proiz - Comunicação integreda"],
                    :url => [root_url],
                    :title => ['Proiz - Comunicação integreda'],
                    :image => [('/assets/logo_proiz.png')],
                    :description => ['A Proiz é uma agência de comunicação integrada onde as melhores práticas do Design Gráfico, Publicidade, Propaganda e Marketing se unem a ideias criativas para fortalecer a construção e promoção de marcas.
Buscando fornecer aos nossos clientes um processo coerente e forte de Branding, organizamos um pacote abrangente de atividades criativas. Estamos prontos para atender as necessidades de comunicação do seu negócio!']
                  }
  end
end
