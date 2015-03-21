require 'timeout'
require_relative 'logger'
require_relative 'template_worker'

class EmailWorker < TemplateWorker
  def self.antes_execuacao(parametros)
    @@limite_timeout = 10
    @@limite_tentativas = 5
    @@contador_tentativas = 0
  end

  def self.trabalhar parametros
    usuario = buscar_usuario(parametros[:usuario])
    corpo = gerar_mensagem(parametros[:mensagem],
                           usuario)
    assunto = gerar_assunto(parametros[:mensagem],
                            usuario)
    timeout(@@limite_timeout) do
      enviar_email(de: usuario,
                   para: parametros[:destinatarios],
                   assunto: assunto,
                   corpo: corpo)
    end
  end

  def self.deve_tentar_novamente(e, parametros)
    @@contador_tentativas += 1
    @@contador_tentativas < @@limite_tentativas
  end

  def self.final_execucao(parametros)
    @@contador_tentativas = 0
  end

  def self.gerar_mensagem(tipo_de_mensagem, usuario)
    "corpo do email de #{tipo_de_mensagem} enviado por #{usuario}"
  end

  def self.gerar_assunto(tipo_de_mensagem, usuario)
    "#{tipo_de_mensagem} enviado por #{usuario}"
  end

  def self.enviar_email(parametros)
    {
      para: parametros[:para],
      assunto: parametros[:assunto],
      emails_enviados: parametros[:para].size
    }
  end

  def self.buscar_usuario(id_usuario)
    "Usuario #{id_usuario}"
  end
end
