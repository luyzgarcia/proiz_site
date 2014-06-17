class Noticiacateg < ActiveRecord::Base
  belongs_to :noticia
  validates :titulo, :status, :descricao, presence: true, allow_blank: false
  validates :titulo, uniqueness: true  

end
