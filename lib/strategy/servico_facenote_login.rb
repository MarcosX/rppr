class ServicoFaceNoteLogin
  def self.autenticar(dados)
    begin
      resposta = atenticacao_via_post(dados[:usuario])
      return resposta.status
    rescue TimeoutException => e
      log.error('Timeout ao fazer login via FaceNote')
    end
  end
end
