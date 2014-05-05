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
<<<<<<< HEAD
      respond_to do |format|
        format.js {render action: 'new'} # resposta em formato JS para atualizar apenas a DIV= "detalhe_tabela"
      end     
    end        
=======
      render "new"
    end
>>>>>>> origin/master
  end
  
  
  private 
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :status, :name)
  end
end
