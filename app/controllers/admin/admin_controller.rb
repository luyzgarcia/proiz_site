class Admin::AdminController < ApplicationController
  layout 'painel'
  before_filter :authorize
  
  def edit    
    @siteinfo = Siteinfo.first
    @editando = true
    respond_to do |format|
        format.html { render action: 'siteinfo' }
      end   
  end
  
  def update    
    @siteinfo = Siteinfo.first
    
    
   
    
    
    if(@siteinfo.update(siteinfo_params))
      respond_to do |format|          
        format.html { redirect_to admin_siteinfo_path}
      end    
    else
    respond_to do |format|
       
        format.html { render action: 'siteinfo' }
      end   
    end    
  end
  
  private 
  
  def siteinfo_params
    #params.require(:siteinfo).permit(:id, :nomesite, :sobre, :metatags, :logradouro, :numero, :bairro, :cidade, :estado, :pais, :email, :telefone) 
    params.fetch(:siteinfo, {}).permit(:id, :nomesite, :sobre, :metatags, :logradouro, :numero, :bairro, :cidade, :estado, :pais, :email, :telefone)
  end
  
end
