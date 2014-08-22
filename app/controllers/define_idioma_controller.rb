class DefineIdiomaController < ApplicationController
  def portugues
    logger.info 'Entro no normal'
    I18n.locale = 'pt-BR'
    set_session_and_redirect
  end

  def ingles
    logger.info 'Entro no en normal'
    I18n.locale = :en
    set_session_and_redirect
  end
  
  private
  
  def set_session_and_redirect
    session[:locale] = I18n.locale
    #redirect_to :back
    redirect_to root_path
    rescue ActionController::RedirectBackError
      redirect_to :root
      #redirect_to :back
  end
end
