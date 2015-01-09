class Login
  FACE_NOTE_SUCESSO = 200
  FACE_NOTE_REVOCADO = 403
  FACE_NOTE_BLOQEUADO = 408

  ZUITER_SUCESSO = 202
  ZUITER_PENDENTE = 400

  def self.com(parametros)
    resposta = if parametros[:metodo] == :facenote
                 ServicoFaceNoteLogin.autenticar(parametros[:dados])
               elsif parametros[:metodo] == :zuiter
                 parametros[:dados][:usuario].downcase!
                 ServicoZuiterLogin.autenticar(parametros[:dados])
               end

    status, mensagem = false, 'não foi possível autenticar'

    if resposta == FACE_NOTE_SUCESSO || resposta == ZUITER_SUCESSO
      status, mensagem = true, 'login com sucesso'
    elsif resposta == FACE_NOTE_REVOCADO
      status, mensagem = false, 'acesso revocado'
    elsif resposta == FACE_NOTE_BLOQEUADO
      status, mensagem = false, 'aplicação bloqueada'
    elsif resposta == ZUITER_PENDENTE
      status, mensagem = false, 'autorização pendente'
    end

    {status: status, mensagem: mensagem}
  end
end
