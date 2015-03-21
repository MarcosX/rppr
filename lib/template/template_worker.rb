require 'timeout'
require_relative 'logger'

class TemplateWorker
  @@logger = Logger

  def self.executar(parametros)
    antes_execuacao(parametros)
    begin
      resultado = trabalhar(parametros)
    rescue Exception => e
      @@logger.error("#{e.class} ao executar #{self}")
      retry if deve_tentar_novamente(e, parametros)
    end
    final_execucao(parametros)
    resultado
  end
end
