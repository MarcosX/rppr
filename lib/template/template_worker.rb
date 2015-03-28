require 'timeout'
require_relative 'logger'

class TemplateWorker
  attr_reader :logger

  def executar(parametros)
    antes_execuacao(parametros)
    begin
      resultado = trabalhar(parametros)
    rescue Exception => e
      @logger.error("#{e.class} ao executar #{self.class}")
      retry if deve_tentar_novamente(e, parametros)
    end
    resultado
  end

  def antes_execuacao(parametros)
    @logger = Logger
  end
end
