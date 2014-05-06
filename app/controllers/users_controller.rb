class UsersController < ApplicationController
  
  def index 
    @users = User.all
    respond_to do |format|
        format.js
    end
  end
  
  def show
    @users = User.all
  end
  
  def new
    @user = User.new
    respond_to do |format|
        format.js {render action: 'new'}
        format.html {render action: 'new'}
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.js { redirect_to users_show_path }
      end      
      
    else
      respond_to do |format|
        format.js {render action: 'new'} # resposta em formato JS para atualizar apenas a DIV= "detalhe_tabela"
      end  
    end
  end
  
  
  private 
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :status, :name)
  end
end
