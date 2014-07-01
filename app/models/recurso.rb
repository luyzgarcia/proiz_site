class Recurso < ActiveRecord::Base
  
  belongs_to :noticia
  
  has_attached_file :arquivo,
  :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
  :url => "/system/:attachment/:id/:basename_:style.:extension"
  #:styles => { :medium => "300x300>", :thumb => "100x100>" }
  #validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
end
