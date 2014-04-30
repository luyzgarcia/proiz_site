class UsersController < ApplicationController
  
  def index 
    @users = User.all
    respond_to do |format|
        format.js
    end
  end
  
  def new
    @user = User.new
    respond_to do |format|
        format.js
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to painel_index_path, :notice => "Cadastrado"
    else
      render "new"
    end        
  end
  
  
  private 
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
