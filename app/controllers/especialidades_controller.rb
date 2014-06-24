class EspecialidadesController < ApplicationController
   respond_to :json, :html  

  def index
    @especialidades = Especialidade.all.where('status = 1')
  end
  
  def contato
    logger.info 'entrou em contato'
    @nome = params[:nome]
    @sobrenome = params[:sobrenome]
    @email = params[:email]
    @telefone = params[:email]
    
  end
end
