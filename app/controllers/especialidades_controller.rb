class EspecialidadesController < ApplicationController
   before_action :getEspecialidades
   respond_to :json, :html  

  def index
    #@especialidades = Especialidade.all.where('status = 1')
  end
  
  def contato
    dados = {nome: params[:nome], 
             sobrenome: params[:sobrenome],
             email: params[:email],
             telefone: params[:telefone],
             especialidades: params[:especialidades]}
             
    ProizMailer.contato_especialidades(dados).deliver
    
  end
  
  private
  
  def getEspecialidades
    @especialidades = Especialidade.all.where(:idioma => I18n.locale ).where('status = 1')
  end
end
