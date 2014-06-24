class EspecialidadeMailer < ActionMailer::Base
  default from: 'luiz@proiz.com.br'
  
  def email_teste
    mail(to: 'luyzgarcia@gmail.com', subject: 'Email teste do site proiz')
  end
end