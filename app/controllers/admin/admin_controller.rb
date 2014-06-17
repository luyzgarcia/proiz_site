class Admin::AdminController < ApplicationController
  layout 'painel'
  before_filter :authorize
  
end
