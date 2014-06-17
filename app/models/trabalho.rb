class Trabalho < ActiveRecord::Base
  has_one :categoriatrabalho
  has_many :imagems, :dependent => :destroy, :order => 'ordem ASC'
  has_many :fichatecnicas, :dependent => :destroy, :order => 'ordem ASC'
  #has_one :imagem
  accepts_nested_attributes_for :imagems, :allow_destroy => true
  accepts_nested_attributes_for :fichatecnicas, :allow_destroy => true
  
  
  has_attached_file :imagem_principal,
  #:path => ":rails_root/public/system/trabalhos/:attachment/:id/:basename_:style.:extension",
  #:url => "/system/:attachment/:id/:basename_:style.:extension",
  :default_url => "/system/missing.png",
  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :imagem_principal, :content_type => /\Aimage\/.*\Z/
  
  has_attached_file :imagem_vitrine,
  #:path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
  #:url => "/system/:attachment/:id/:basen ame_:style.:extension",
  :default_url => "/system/missing.png",
  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :imagem_vitrine, :content_type => /\Aimage\/.*\Z/
  
  validates_presence_of :titulo
  
end