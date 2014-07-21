ProizAdmin::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    #address:              'mail.proiz.com.br',
    #port:                 25,
    #domain:               'proiz.com.br',
    #user_name:            'atendimento@proiz.com.br',
    #password:             'intproiz12',
    #descomentar linhas abaixou depois
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gmail.com',
    user_name:            'luyzgarcia@gmail.com',
    password:             'Lui77243194',
    #######
    authentication:       'plain',
    enable_starttls_auto: true,  
    openssl_verify_mode:  'none'
    }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  config.assets.logger = false
    
  #config.consider_all_requests_local = false
  
  #Paperclip.options[:command_path] = "C:/Program Files/ImageMagick-6.8.9-Q16"
  
  #$config['link_vault_aws_endpoint'] = "http://imagens.proiz.s3.amazonaws.com";
  #upload para amazon s3 buckets usando paperclip - para testes locais deve-se descomentar abaixo
  config.paperclip_defaults = {
    :storage => :s3,
    :s3_credentials => {
      :bucket => 'imagens.proiz',
      :access_key_id => 'AKIAIYZHJEVMTZYNYQKQ',
      :secret_access_key => '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',
      :url => "http://imagens.proiz.s3.amazonaws.com",
      :path => "images/:class/:id.:style.:extension"
    }
  }
end
