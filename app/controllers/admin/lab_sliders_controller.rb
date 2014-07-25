class Admin::LabSlidersController < Admin::AdminController
  
  def index 
    @imagem = LabSlider.all
    respond_to do |format|
      format.html
      format.js        
    end
  end
  
  def new
    @imagem = LabSlider.new
    respond_to do |format|
        format.html {render action: 'new'}
    end
  end
  
  def create
    @imagem = LabSlider.new(labslider_params)
    if @imagem.save
      respond_to do |format|
        format.html { redirect_to admin_lab_sliders_path }
      end      
      
    else
      respond_to do |format|
        format.js { render action: 'new' }
        format.html {  render action: 'new' }
      end  
    end
  end
  
  def edit
    @imagem = LabSlider.find(params[:id])
    @editando = true
    respond_to do |format|
       format.html {render action: 'new'}
       format.js { render action: 'new'}
    end
  end
  def update
    @imagem = LabSlider.find(params[:id])
    #begin
      if(@imagem.update!(labslider_params))
        respond_to do |format|
            format.html { redirect_to admin_lab_sliders_path}
          end         
      end
  end
  
  def destroy
    @imagem = LabSlider.find(params[:id])
    @imagem.destroy
    @imagem_id = @imagem.id
    respond_to do |format|
      format.js { render action: 'destroy'}
    end
  end
  
  
  private 
  
  def labslider_params
    params.require(:lab_slider).permit(:titulo, :status, :name, :imagem)
  end
end
