class Noticia < ActiveRecord::Base
  
  has_one :noticiacateg
  
  has_attached_file :imagem_miniatura,
  #:path => ":rails_root/public/system/trabalhos/:attachment/:id/:basename_:style.:extension",
  #:url => "/system/:attachment/:id/:basename_:style.:extension",
  :default_url => "/system/missing.png",
  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :imagem_miniatura, :content_type => /\Aimage\/.*\Z/
  
  
  def self.buscar(search)  
    if search  
      find(:all, :conditions => ['titulo LIKE ?', "%#{search}%"])  
    else  
      find(:all).limit(5)
    end  
  end

end
