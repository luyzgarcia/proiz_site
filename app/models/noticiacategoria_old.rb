class Noticiacategoria < ActiveRecord::Base
  
  validates :titulo, :status, :descricao, presence: true, allow_blank: false
  validates :titulo, uniqueness: true

end
