class Categoriatrabalho < ActiveRecord::Base
  before_create :define_idioma
  belongs_to :trabalho
  
  validates :titulo, :status, presence: true, allow_blank: false
  #validates :titulo, uniqueness: true
  
  def to_s
    self.titulo
  end
  
  
  private
  
  def define_idioma
    self.idioma = I18n.locale
  end
  
end
