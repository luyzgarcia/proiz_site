class SobreController < ApplicationController
  before_action :getClientes, only: [:index]
  before_action :setmetaTags
  
  def setmetaTags
    logger.info 'set metatags'
    set_meta_tags :title => 'Sobre',
                  :description => "All text about keywords, other keywords"
  end
  
  def index
    logger.info 'index' 
  end
  
  def getClientes
    @clientes = Cliente.all.where(status: '1')
  end
end
