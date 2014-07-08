class Siteinfo < ActiveRecord::Base
  
  validates_presence_of :id, :nomesite, :sobre, :metatags, :logradouro, :numero, :bairro, :cidade, :estado, :pais, :email, :telefone  
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end
