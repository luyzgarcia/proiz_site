class SobreController < ApplicationController
  before_action :getClientes, only: [:index]
  
  def index
  end
  
  def getClientes
    @clientes = Cliente.all.where(status: '1')
  end
end
