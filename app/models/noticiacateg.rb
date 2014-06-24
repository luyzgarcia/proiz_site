class Noticiacateg < ActiveRecord::Base
  belongs_to :noticia
  validates :titulo, :descricao, :status, presence: true
  validates :titulo, uniqueness: true  

end
