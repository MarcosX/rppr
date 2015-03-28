require 'timeout'
require_relative 'logger'

class EmailWorker
  def enviar parametros
    @limite_timeout = 10
    @limite_tentativas = 5
    @logger = Logger

    usuario = buscar_usuario(parametros[:usuario])
    corpo = gerar_mensagem(parametros[:mensagem],
                           usuario)
    assunto = gerar_assunto(parametros[:mensagem],
                           usuario)
    contador_tentativas = 0
    begin
      timeout(@limite_timeout) do
        enviar_email(de: usuario,
                     para: parametros[:destinatarios],
                     assunto: assunto,
                     corpo: corpo)
      end
    rescue Timeout::Error
      contador_tentativas += 1
      @logger.error("Timeout::Error em EmailWorker.enviar_email")
      retry if contador_tentativas < @limite_tentativas
    end
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
