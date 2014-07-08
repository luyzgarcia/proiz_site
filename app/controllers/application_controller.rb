class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  
  helper_method :current_user
  
  
  # custom 404
    #logger.debug 'Vai verificar se tem erros'
    #rescue_from ActiveRecord::RecordNotFound do |exception|

      # Put loggers here, if desired.
  #    looger.info 'Entrou no error'
#      redirect_to root_path
      #render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
 #   end
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def set_locale
    #logger.debug "default_url_options is passed options: #{params[:locale]}\n"
    #I18n.locale = params[:locale]
    I18n.locale = session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
  
  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to admin_log_in_path, alert: "Para acessar essa pagina eh necessario estar logado"
      end
    end
end
