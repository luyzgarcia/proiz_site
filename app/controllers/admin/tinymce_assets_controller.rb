class Admin::TinymceAssetsController < Admin::AdminController
  respond_to :json

  def create
    #Pega a largura e altura da imagem geometry
    geometry = Paperclip::Geometry.from_file params[:file]
    
    #usa a Tabela imagem cara criar um nova
    image    = Imagem.create(:image => params[:file], :descricao => params[:alt])

    render json: {
      image: {
        url:    image.image.url,
        height: geometry.height.to_i,
        width:  geometry.width.to_i
      }
    }, layout: false, content_type: "text/html"
  end
end