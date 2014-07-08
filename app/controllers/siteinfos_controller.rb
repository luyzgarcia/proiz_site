class SiteinfosController < ApplicationController
  
  def index
    @siteinfo = Siteinfo.first
  end
  
  def edit    
    @siteinfo = Siteinfo.first
    @editando = true
    respond_to do |format|
      format.html {redirect_to 'admin#site_info'}
    end    
  end
  
end