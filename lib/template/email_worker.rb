require 'timeout'
require_relative 'logger'
require_relative 'template_worker'

class EmailWorker < TemplateWorker
  attr_reader :limite_timeout, :limite_tentativas, :contador_tentativas

  protected
  def trabalhar(parametros)
    usuario = buscar_usuario(parametros[:usuario])
    corpo = gerar_mensagem(parametros[:mensagem],
                           usuario)
    assunto = gerar_assunto(parametros[:mensagem],
                            usuario)

    timeout(@limite_timeout) do
      enviar_email(de: usuario,
                   para: parametros[:destinatarios],
                   assunto: assunto,
                   corpo: corpo)
    end
  end

  def antes_execuacao(parametros)
    super(parametros)
    @limite_timeout = 10
    @limite_tentativas = 5
    @contador_tentativas = 0
  end

  def deve_tentar_novamente(e, parametros)
    @contador_tentativas += 1
    @contador_tentativas < @limite_tentativas
  end

  private
  def gerar_mensagem(tipo_de_mensagem, usuario)
    "corpo do email de #{tipo_de_mensagem} enviado por #{usuario}"
  end

  def gerar_assunto(tipo_de_mensagem, usuario)
    "#{tipo_de_mensagem} enviado por #{usuario}"
  end

  def enviar_email(parametros)
    {
      para: parametros[:para],
      assunto: parametros[:assunto],
      emails_enviados: parametros[:para].size
    }
  end

  def buscar_usuario(id_usuario)
    "Usuario #{id_usuario}"
  end
end
