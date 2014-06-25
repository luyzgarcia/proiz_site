class ProizMailer < ActionMailer::Base
  default from: 'atendimento@proiz.com.br'
  
  def contato_especialidades(dados)
    @dados = dados
    mail(to: 'luyzgarcia@gmail.com', subject: 'Contato sobre Especialidades')
  end
  
  def contato(dados)
    @dados = dados
    mail(to: 'luyzgarcia@gmail.com', subject: 'Proiz - Contato')
  end
  
  
  def email_teste
    mail(to: 'atendimento@proiz.com.br', subject: 'Email teste do site proiz')
  end
end