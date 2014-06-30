class Especialidade < ActiveRecord::Base
  before_create :define_idioma
  validates :titulo, :conteudo, :status, :imagem_principal, presence: true
  validates :titulo, uniqueness: true
  
  has_attached_file :imagem_principal,
  :path => ":rails_root/public/system/especialidades/:attachment/:id/:basename_:style.:extension",
  :url => "/system/especialidades/:attachment/:id/:basename_:style.:extension",
  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :imagem_principal, :content_type => /\Aimage\/.*\Z/
  
  private
  
  def define_idioma
    self.idioma = I18n.locale
  end
  
end
