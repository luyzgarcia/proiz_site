class ProizMailer < ActionMailer::Base
  default from: 'atendimento@proiz.com.br'
  
  def contato_especialidades(dados)
    @dados = dados
    mail(to: 'atendimento@proiz.com', subject: 'Contato sobre Especialidades')
    mail(to: 'luyzgarcia@gmail.com', subject: 'Contato sobre Especialidades')
  end
  
  def contato(dados)
    @dados = dados
    mail(to: 'atendimento@proiz.com', subject: 'Proiz - Contato')
    mail(to: 'luyzgarcia@gmail.com', subject: 'Proiz - Contato')
  end
end