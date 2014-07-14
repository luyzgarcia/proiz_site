class Noticiacateg < ActiveRecord::Base
  before_create :define_idioma
  
  belongs_to :noticia
  validates :titulo, :descricao, :status, presence: true
  #validates :titulo, uniqueness: true  

  private
  
  def define_idioma
    self.idioma = I18n.locale
  end

end
