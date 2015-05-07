class Trabalho < ActiveRecord::Base
  before_create :define_idioma

  #validates_presence_of :introducao, :imagem_vitrine, :descricao_vitrine

  extend FriendlyId
  friendly_id :titulo, use: :slugged

  validates_presence_of :introducao, :imagem_vitrine, :descricao_vitrine, :if => 'tipo == "M"'

  validates_presence_of :titulo, :categoria_id, :introducao, :imagem_vitrine, :descricao_vitrine, :if => 'tipo == "T"'

  has_one :categoriatrabalho
  belongs_to :metatag
  accepts_nested_attributes_for :metatag
  has_many :imagems, :dependent => :destroy, :order => 'ordem ASC'
  has_many :fichatecnicas, :dependent => :destroy, :order => 'ordem ASC'

  #has_one :imagem
  accepts_nested_attributes_for :imagems, :allow_destroy => true
  accepts_nested_attributes_for :fichatecnicas, :allow_destroy => true


  has_attached_file :imagem_principal,
  #:path => ":rails_root/public/system/trabalhos/:attachment/:id/:basename_:style.:extension",
  #:url => "/system/:attachment/:id/:basename_:style.:extension",
  :default_url => "system/missing.png",
  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :imagem_principal, :content_type => /\Aimage\/.*\Z/

  has_attached_file :imagem_vitrine,
  #:path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
  #:url => "/system/:attachment/:id/:basen ame_:style.:extension",
  :default_url => "/system/missing.png",
  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :imagem_vitrine, :content_type => /\Aimage\/.*\Z/

  #validates_presence_of :titulo, :categoria_id, :imagem_principal, :descricao_principal, :imagem_vitrine, :descricao_vitrine,
  #                      :fichatecnicas, :introducao, :status, :orientacao, :imagems


  #logger.info "Locale=>#{I18n.locale}\n"
  #default_scope self.where(:idioma => I18n.locale )
  def should_generate_new_friendly_id?
    slug.blank? || titulo_changed?
  end

  def self.trabalho_prev(trabalho)
    #Fazer select para pegar
    #SELECT CAMPO FROM TABELA WHERE ID = (SELECT MAX(ID) FROM TABELA WHERE ID < trabalho.id)
    retorna = Trabalho.find_by_sql("select * from trabalhos where id = (select min(id) from trabalhos where tipo = 'M' and id > #{trabalho.id} )")
     if (!retorna.present?)
      retorna = trabalho
     end
    retorna
  end

  def self.trabalho_next(trabalho)
    retorna = Trabalho.find_by_sql("select * from trabalhos where id = (select max(id) from trabalhos where tipo = 'M' and id < #{trabalho.id} )")
     if (!retorna.present?)
      retorna = trabalho
     end
     retorna
  end

  def imagem_url
    imagem_principal.url(:medium)
  end

  private

  def define_idioma
    self.idioma = I18n.locale
  end

end
