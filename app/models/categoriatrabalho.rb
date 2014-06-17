class Categoriatrabalho < ActiveRecord::Base
  belongs_to :trabalho
  
  validates :titulo, :status, presence: true, allow_blank: false
  validates :titulo, uniqueness: true
    
  def to_s
    self.titulo
  end
end
