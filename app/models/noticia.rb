class Noticia < ActiveRecord::Base
  scope :ativo, -> { where(status: '1')}
  
  extend FriendlyId
  friendly_id :titulo, use: :slugged
  before_create :define_idioma
  
  validates :titulo,:conteudo, presence: true
  #validates :titulo, uniqueness: true
  #validates_associated :noticiacateg
 # validates_presence_of :noticiacateg, :message => ":Selecione uma categoria de noticia." 
  validates :noticiacateg_id, presence: true
  has_one :noticiacateg
  #accepts_nested_attributes_for :noticiacateg
  
  has_attached_file :imagem_miniatura,
  #:path => ":rails_root/public/system/trabalhos/:attachment/:id/:basename_:style.:extension",
  #:url => "/system/:attachment/:id/:basename_:style.:extension",
  :default_url => "/system/missing.png",
  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :imagem_miniatura, :content_type => /\Aimage\/.*\Z/
  
  has_many :recursos, :dependent => :destroy
  accepts_nested_attributes_for :recursos, :allow_destroy => true
  
  def self.buscar(search)  
    if search  
      find(:all, :conditions => ['titulo LIKE ?', "%#{search}%"])  
    else  
      find(:all).limit(5)
    end  
  end
  
  def imagem_url
    imagem_miniatura.url(:medium)
  end
  
  def publicado
    I18n.l self.created_at, :format => :curto2
  end
  
  
  private
  
  def define_idioma
    self.idioma = I18n.locale
  end

end
