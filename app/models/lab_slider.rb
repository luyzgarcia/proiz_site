class LabSlider < ActiveRecord::Base
  
  has_attached_file :imagem,
  :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
  :url => "/system/:attachment/:id/:basename_:style.:extension",
  :default_url => "/system/missing.png",
  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :imagem, :content_type => /\Aimage\/.*\Z/
end
