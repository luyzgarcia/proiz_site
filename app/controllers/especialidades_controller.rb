class EspecialidadesController < ApplicationController
   respond_to :json, :html  

  def index
    @especialidades = Especialidade.all.where('status = 1')
  end
  
  def contato
    dados = {nome: params[:nome], 
             sobrenome: params[:sobrenome],
             email: params[:email],
             telefone: params[:telefone],
             especialidades: params[:especialidades]}
             
    ProizMailer.contato_especialidades(dados).deliver
    
  end
end
