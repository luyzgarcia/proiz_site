class Admin::UsersController < Admin::AdminController
  
#Arquivo modificado  
  def index 
    @users = User.all
    respond_to do |format|
      format.html
      format.js        
    end
  end
  
  def show
    @users = User.all
  end
  
  def new
    @user = User.new
    respond_to do |format|
        format.html {render action: 'new'}
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.js { redirect_to admin_users_path }
      end      
      
    else
      respond_to do |format|
        format.js { render action: 'new' }
        format.html {  render action: 'new' }
      end  
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @editando = true
    respond_to do |format|
       format.html {render action: 'new'}
       format.js { render action: 'new'}
    end
  end
  def update
    @user = User.find(params[:id])
    #begin
      if(@user.update!(user_params))
        respond_to do |format|
            format.html { redirect_to admin_users_path}
          end         
      end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    @user_id = @user.id
    respond_to do |format|
      format.js { render action: 'destroy'}
    end
  end
  
  
  private 
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :status, :name)
  end
end
