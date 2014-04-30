class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to log_in_path, alert: "Para acessar essa pagina eh necessario estar logado"
      end
    end
end
