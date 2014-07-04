class ErrorsController < ApplicationController
  def routing
    @noticias = Noticia.last(3)
    
    render '404'
    #render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => 'application'
    #render_404
  end
end