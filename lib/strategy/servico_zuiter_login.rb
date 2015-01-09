class ServicoZuiterLogin
  def self.autenticar(dados)
    begin
      resposta = atenticacao_via_post(dados[:usuario])
      return resposta.status
    rescue TimeoutException => e
      log.error('Timeout ao fazer login via Zuiter')
    end
  end
end
