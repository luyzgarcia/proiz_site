class Recurso < ActiveRecord::Base
  
  belongs_to :artigo
  
  validates :dir, :tipo, presence: true 
end
