class ErrorsController < ApplicationController
  before_action :setmetaTags
  
  def routing
    @noticias = Noticia.last(3)
    
    render '404'
    #render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => 'application'
    #render_404
  end
  
  def setmetaTags
    set_meta_tags :title => 'Página não encontrada'  
  end       
end