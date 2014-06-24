class Cliente < ActiveRecord::Base
  
  validates_presence_of :nome, :descricao, :status, :url_site, :logo
  validates :nome, uniqueness: true
  
  has_attached_file :logo,
  :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
  :url => "/system/:attachment/:id/:basename_:style.:extension",
  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
  
end
