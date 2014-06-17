class EspecialidadesController < ApplicationController
   respond_to :json, :html  

  def index
    @especialidades = Especialidade.all.where('status = 1')
  end  
end
