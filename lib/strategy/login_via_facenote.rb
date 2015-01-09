class LoginViaFaceNote
  FACE_NOTE_SUCESSO = 200
  FACE_NOTE_REVOCADO = 403
  FACE_NOTE_BLOQEUADO = 408

  def self.autenticar(parametros)
    resposta = ServicoFaceNoteLogin.autenticar(parametros)
    status, mensagem = false, 'não foi possível autenticar'

    if resposta == FACE_NOTE_SUCESSO
      status, mensagem = true, 'login com sucesso'
    elsif resposta == FACE_NOTE_REVOCADO
      status, mensagem = false, 'acesso revocado'
    elsif resposta == FACE_NOTE_BLOQEUADO
      status, mensagem = false, 'aplicação bloqueada'
    end

    {status: status, mensagem: mensagem}
  end
end
