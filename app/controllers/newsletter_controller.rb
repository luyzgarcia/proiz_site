class NewsletterController < ApplicationController
  respond_to :json, :html
  
  def subscribe
    @cadastro = Newsletter.new(newsletter_params)
    #@cliente = Cliente.new(cliente_params)
    if(@cadastro.save)
      respond_to do |format|
         format.js { render :subscribe }
         format.html { redirect_to root_path }
      end
    else          
      respond_to do |format|
        format.js { render action: :subscribe_error}
      end
    end
  end
  
  def unsubscribe
    
  end
  
  private
  def newsletter_params
    params.require(:newsletter).permit(:id,:email,:status)
  end
  
end
