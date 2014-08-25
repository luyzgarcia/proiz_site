class ProizMailer < ActionMailer::Base
  default from: 'atendimento@proiz.com.br'
  
  def contato_especialidades(dados)
    @dados = dados
    mail(to: 'atendimento@proiz.com.br', subject: 'Contato sobre Especialidades')
    #mail(to: 'luyzgarcia@gmail.com', subject: 'Contato sobre Especialidades')
  end
  
  def contato(dados)
    @dados = dados
    mail(to: 'atendimento@proiz.com.br', subject: 'Proiz - Contato')
    #mail(to: 'luyzgarcia@gmail.com', subject: 'Proiz - Contato')
  end
end