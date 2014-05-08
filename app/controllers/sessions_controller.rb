class SessionsController < ApplicationController
  layout "painel"
  
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      #render "painel/index"
      redirect_to paginas_index_path
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end    
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path, :notice => "Logout"
    #render "new", :notice =>"Logout"
  end
  
end
