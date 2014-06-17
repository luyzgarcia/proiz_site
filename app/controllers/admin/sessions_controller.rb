class Admin::SessionsController < Admin::AdminController
  skip_before_filter :authorize

  def new
    user = current_user
    if user
      redirect_to paginas_index_path
    end
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
    redirect_to admin_log_in_path, :notice => "Logout"
    #render "new", :notice =>"Logout"
  end
  
end
